# frozen_string_literal: true

require_relative "./spec_helper"

RSpec.describe Unit::Payment do
  before do
    configure_tests
  end

  describe "create book payment" do
    let(:create_response) do
      described_class.create_book_payment(amount: 1000, description: "test payment", relationships: { account: Unit::Types::Relationship.new("depositAccount", "27573").to_hash,
                                                                                                      counterpartyAccount: Unit::Types::Relationship.new("depositAccount", "36981").to_hash })
    end
    it "should create a book payment" do
      expect(response.data["type"]).to eq("bookPayment")
    end

    it "update a book payment" do
      response = described_class.update_book_payment(payment_id: create_response.data["id"], tags: { purspose: "test" })
      expect(response.data["type"]).to eq("bookPayment")
    end
  end
end
