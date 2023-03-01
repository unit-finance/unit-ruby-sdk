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
  end
end
