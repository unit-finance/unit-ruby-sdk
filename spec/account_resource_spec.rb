# frozen_string_literal: true

require_relative "./spec_helper"

RSpec.describe Unit::Account::Deposit do
  before do
    configure_tests
  end

  it "Should create deposit account" do
    response = described_class.create_deposit_account(deposit_product: "checking", tags: { "purpose": "checking" }, relationships: RELATIONSHIPS)
    expect(response.data["type"]).to eq("depositAccount")
  end

  it "Get a deposit account" do
    response = described_class.get_deposit_account(account_id: "51506")
    expect(response.data["type"]).to eq("depositAccount")
  end

  it "List accounts" do
    response = described_class.list_deposit_accounts(offset: 0, limit: 1)
    response.data.each do |account|
      expect(account["type"]).to be_truthy
    end
  end

  it "Update account" do
    response = described_class.update_deposit_account(account_id: 82_661, tags: { "purpose": "tax" })
    expect(response.data["type"]).to eq("depositAccount")
  end

  it "Limits" do
    response = described_class.limits(account_id: 82_661)
    expect(response.data["type"]).to eq("limits")
  end

  it "Close account" do
    response = described_class.close_deposit_account(account_id: 82_661, reason: "NegativeBalance")
    expect(response.data["type"]).to eq("depositAccount")
  end

  it "Reopen account" do
    reopen_response = described_class.reopen_account(account_id: 82_661, reason: "test")
    expect(reopen_response.data["type"]).to eq("depositAccount")
  end

  it "Freezes account" do
    response = described_class.freeze_account(account_id: 82_661, reason: "Fraud", reason_text: "test")
    expect(response.data["type"]).to eq("depositAccount")
  end

  it "Unfreezes account" do
    response = described_class.unfreeze_account(account_id: 82_661)
    expect(response.data["type"]).to eq("depositAccount")
  end

  it "Add account owners" do
    response = described_class.add_owners(account_id: 51_502, customers: OWNERS)
    expect(response.data["type"]).to eq("depositAccount")
  end

  it "Remove account owners" do
    response = described_class.remove_owners(account_id: 51_502, customers: OWNERS)
    expect(response.data["type"]).to eq("depositAccount")
  end
end
