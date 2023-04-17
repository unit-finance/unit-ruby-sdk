# frozen_string_literal: true

require_relative "./spec_helper"

RSpec.describe Unit::Fee do
  before do
    configure_tests
  end

  it "creates a fee" do
    response = described_class.create_fee(account_id: "27573", amount: 12_345, description: "test", tags: { purpose: "test" }, idempotency_key: "123")
    expect(response.data["type"]).to eq("fee")
  end
end
