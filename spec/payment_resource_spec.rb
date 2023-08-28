# frozen_string_literal: true

require_relative "./spec_helper"

RSpec.describe Unit::Payment do
  before do
    configure_tests
  end

  describe "create book payment" do
    let(:create_response) do
      described_class.create_book_payment(amount: 1000, description: "test payment", account_id: "27573", counterparty_account_id: "36981", tags: { "test": "test-tag" })
    end
    it "should create a book payment" do
      expect(create_response.data["type"]).to eq("bookPayment")
    end

    it "update a book payment" do
      response = described_class.update_book_payment(payment_id: create_response.data["id"], tags: { purspose: "test" })
      expect(response.data["type"]).to eq("bookPayment")
    end

    describe "ach payments" do
      let(:inline_payment) do
        described_class.create_ach_payment_inline(account_id: "27573", amount: 1000, direction: "Credit", counterparty: COUNTERPARTY, description: "test payment")
      end

      it "creates ach payment inline" do
        expect(inline_payment.data["type"]).to eq("achPayment")
      end

      it "creates ach payment to linked counterparty request" do
        response = described_class.create_ach_payment_linked(account_id: "27573", counterparty_id: "313118", amount: 1000, direction: "Credit", description: "test payment")
        expect(response.data["type"]).to eq("achPayment")
      end

      it "creates ach payment with plaid token" do
        response = described_class.create_ach_payment_with_plaid_token(account_id: "27573", amount: 1000, direction: "Credit", description: "test payment", plaid_processor_token: "processor-sandbox-5205d9ec-74fa-445e-a8e5-1b49cfcb6d11")
        expect(response.data["type"]).to eq("achPayment")
      end

      it "gets payment" do
        response = described_class.get_payment(payment_id: inline_payment.data["id"])
        expect(response.data["type"]).to eq("achPayment")
      end

      it "lists payments" do
        response = described_class.list_payments(status: ["Pending"], direction: %w[Credit Debit], type: %w[BillPayment AchPayment])
        expect(response.data[0]["type"]).to eq("achPayment")
      end

      it "creates bulk payment" do
        response = described_class.create_bulk_payment(requests: [Unit::Payment::CreateBookPaymentRequest.new(amount: 1000, description: "test payment", account_id: "27573", counterparty_account_id: "36981", tags: { "test": "test-tag" }),
                                                                  Unit::Payment::CreateWirePaymentRequest.new(amount: 1000, description: "test payment", account_id: "27573", counterparty: WIRE_COUNTERPARTY, tags: { "test": "test-tag" }),
                                                                  Unit::Payment::CreateAchPaymentInlineRequest.new(amount: 1000, direction: "Credit", counterparty: COUNTERPARTY, description: "test payment", account_id: "27573", tags: { "test": "test-tag" }),
                                                                  Unit::Payment::CreatePaymentLinkedRequest.new(amount: 1000, direction: "Credit", description: "test payment", account_id: "27573", counterparty_id: "313118", tags: { "test": "test-tag" }),
                                                                  Unit::Payment::CreateWithPlaidTokenRequest.new(amount: 1000, direction: "Credit", description: "test payment", account_id: "27573", plaid_processor_token: "processor-sandbox-fc8b9c23-b400-40f9-8ee8-c2cabd719721", tags: { "test": "test-tag" })])
        expect(response.data["type"]).to eq("bulkPayments")
      end
    end

    describe "wire payment" do
      it "creates wire payment" do
        response = described_class.create_wire_payment(account_id: "27573", amount: 1000, description: "test payment", counterparty: WIRE_COUNTERPARTY)
        expect(response.data["type"]).to eq("wirePayment")
      end
    end

    describe "batch release" do
      let(:requests) do
        [
          { account_id: "49230", batch_account_id: "1296383", amount: 100, description: "Description 1", sender_name: "Sender Name 1", sender_address: ADDRESS, sender_account_number: "1234" },
          { account_id: "49230", batch_account_id: "1296383", amount: 100, description: "Description 1", sender_name: "Sender Name 1", sender_address: ADDRESS, sender_account_number: "12324" }
        ]
      end
      it "creates a batch release" do
        response = described_class.create_batch_release(requests)
        expect(response.data[0]["type"]).to eq("batchRelease")
      end
    end
  end
end
