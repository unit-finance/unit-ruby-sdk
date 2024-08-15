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
    response = described_class.list_deposit_accounts(offset: 0, limit: 1, customer_id: "751009", status: %w[Open Closed], from_balance: 0, to_balance: 1_000_000, include: ["customer"])
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
    reopen_response = described_class.reopen_account(account_id: 82_661)
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

RSpec.describe Unit::Account::Credit do
  before do
    configure_tests
  end

  it "Should create a credit account" do
    response = described_class.create_credit_account(credit_terms: "credit_terms_test", credit_limit: 20_000, customer_id: "851228", tags: { "purpose": "tax" })
    expect(response.data["type"]).to eq("creditAccount")
  end

  it "Get a credit account" do
    response = described_class.get_credit_account(account_id: "1199767")
    expect(response.data["type"]).to eq("creditAccount")
  end

  it "lists credit accounts" do
    response = described_class.list_credit_accounts(type: "credit", status: %w[Open])
    response.data.each do |account|
      expect(account["type"]).to be_truthy
    end
  end

  it "Update account" do
    response = described_class.update_credit_account(account_id: "792799", tags: { "purpose": "tax" })
    expect(response.data["type"]).to eq("creditAccount")
  end

  it "Limits" do
    response = described_class.limits(account_id: "792800")
    expect(response.data["type"]).to eq("creditLimits")
  end

  it "freezes account" do
    response = described_class.freeze_credit_account(account_id: "956423", reason: "Fraud", reason_text: "test")
    expect(response.data["type"]).to eq("creditAccount")
  end

  it "unfreezes account" do
    response = described_class.unfreeze_credit_account(account_id: "956423")
    expect(response.data["type"]).to eq("creditAccount")
  end

  it "gets credit account balance history" do
    response = described_class.get_balance_history(account_id: "792799")
    expect(response.data[0]["type"]).to eq("accountEndOfDay")
  end
end

RSpec.describe Unit::Account::DACA do
  before do
    configure_tests
  end

  it "Should enter a DACA account" do
    response = described_class.activate_control_agreement(account_id: "36099")
    expect(response.data["type"]).to eq("depositAccount")
  end

  it "Should enter a DACA account" do
    response = described_class.deactivate_control_agreement(account_id: "36099")
    expect(response.data["type"]).to eq("depositAccount")
  end
end
