# frozen_string_literal: true

require_relative "./spec_helper"

RSpec.describe Unit::Fee do
  before do
    configure_tests
  end

  describe "fees requests" do
    let(:fees_creation) { described_class.create_fee(account_id: "36099", amount: 12_345, description: "test") }

    it "creates a fee" do
      expect(fees_creation.data["type"]).to eq("fee")
    end

    it "reverses a fee" do
      response = described_class.reverse_fee(account_id: "36099", transaction_id: fees_creation.data["id"], description: "test", tags: { purpose: "test" })
      expect(response.data["type"]).to eq("feeReversal")
    end
  end
end
