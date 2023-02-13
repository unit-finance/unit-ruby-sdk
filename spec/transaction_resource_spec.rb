# frozen_string_literal: true

require_relative "./spec_helper"

RSpec.describe Unit::Transaction do
  before do
    configure_tests
  end

  it "should create a transaction" do
    response = described_class.get_transaction(transaction_id: "2246427", account_id: "1060441")
    expect(response.data["type"]).to eq("originatedAchTransaction")
  end

  it "should list transactions" do
    response = described_class.list_transactions(limit: 10, type: %w[OriginatedAch ReceivedAch ReturnedAch], include: %w[customer account])
    response.data.each do |transaction|
      expect(transaction["type"]).to be_truthy
    end
  end

  it "should update transaction" do
    response = described_class.update_transaction(transaction_id: "2246427", account_id: "1060441", tags: { "purpose": "test" })
    expect(response.data["type"]).to eq("originatedAchTransaction")
  end

  it "should update the book transaction" do
    response = described_class.update_book_transaction(account_id: "36099", transaction_id: "2158678", summary: "Counterparty: Unit Inc | Description: Funding", tags: { "purpose": "test" })
    expect(response.data["type"]).to eq("bookTransaction")
  end
end
