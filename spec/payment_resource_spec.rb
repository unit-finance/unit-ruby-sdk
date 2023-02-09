# frozen_string_literal: true

require_relative "./spec_helper"

RSpec.describe Unit::Payment do
  before do
    configure_tests
  end

  describe "book payment" do
    let(:create_response) do
      described_class.create_book_payment(amount: 1000, description: "test payment", account_id: "27573", counterparty_account_id: "36981")
    end
    it "should create a book payment" do
      expect(create_response.data["type"]).to eq("bookPayment")
    end

    it "update a book payment" do
      response = described_class.update_book_payment(payment_id: create_response.data["id"], tags: { purspose: "test" })
      expect(response.data["type"]).to eq("bookPayment")
    end
  end

  describe "ach payment" do
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
      response = described_class.create_ach_payment_with_plaid_token(account_id: "27573", amount: 1000, direction: "Credit", description: "test payment", plaid_processor_token: "processor-sandbox-7cc7c614-47f6-4532-86b8-e15fdc680bf3")
      expect(response.data["type"]).to eq("achPayment")
    end

    it "gets received ach payment" do
      response = described_class.get_received_ach_payment(payment_id: "1232")
      expect(response.data["type"]).to eq("achReceivedPayment")
    end

    it "updates ach payment" do
      response = described_class.update_ach_payment(payment_id: inline_payment.data["id"], tags: { purpose: "test" })
      expect(response.data["type"]).to eq("achPayment")
    end

    it "updates ach received payment" do
      response = described_class.update_ach_received_payment(payment_id: "1232", tags: { purpose: "test" })
      expect(response.data["type"]).to eq("achReceivedPayment")
    end

    it "lists ach payments" do
      response = described_class.list_ach_payments(status: %w[Pending])
      expect(response.data[0]["type"]).to eq("achReceivedPayment")
    end

    it "cancels payment" do
      response = described_class.cancel_payment(payment_id: inline_payment.data["id"])
      expect(response.data["type"]).to eq("achPayment")
    end
  end

  describe "wire payment" do
    it "creates wire payment" do
      response = described_class.create_wire_payment(account_id: "27573", amount: 1000, description: "test payment", counterparty: WIRE_COUNTERPARTY)
      expect(response.data["type"]).to eq("wirePayment")
    end
  end
end
