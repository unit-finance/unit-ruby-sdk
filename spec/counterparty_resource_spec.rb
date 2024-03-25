# frozen_string_literal: true

require_relative "./spec_helper"

RSpec.describe Unit::Counterparty do
  before do
    configure_tests
  end

  let(:counterparty) do
    Unit::Counterparty.create_counterparty(customer_id: "823139", name: "Jo Joel", routing_number: "812345678",
                                           account_number: "1000000001", account_type: "Checking", type: "Business")
  end

  let(:counterparty_with_plaid_token) do
    Unit::Counterparty.create_with_plaid_token(customer_id: "823139", type: "Business", name: "Jo Joel", plaid_processor_token: "processor-sandbox-7179b936-476c-4b3c-a2f8-8255d8cd5b5b")
  end
  it "creates a counterparty" do
    expect(counterparty.data["type"]).to eq("achCounterparty")
  end

  it "creates a counterparty with plaid token" do
    expect(counterparty_with_plaid_token.data["type"]).to eq("achCounterparty")
  end

  it "updates a counterparty" do
    response = Unit::Counterparty.update_counterparty(counterparty_id: counterparty_with_plaid_token.data["id"], plaid_processor_token: "processor-sandbox-3a363ff9-667e-4ed3-8e75-b0b31838faa5")
    expect(response.data["type"]).to eq("achCounterparty")
  end

  it "lists counterparty" do
    response = Unit::Counterparty.list_counterparty(limit: 100, offset: 10, permissions: %w[CreditOnly DebitOnly])
    expect(response.data[0]["type"]).to eq("achCounterparty")
  end

  it "gets a counterparty" do
    response = Unit::Counterparty.get_counterparty(counterparty_id: counterparty.data["id"])
    expect(response.data["type"]).to eq("achCounterparty")
  end

  it "gets a counterparty balance" do
    response = Unit::Counterparty.get_counterparty_balance(counterparty_id: counterparty_with_plaid_token.data["id"])
    expect(response.data["type"]).to eq("counterpartyBalance")
  end

  it "deletes a counterparty" do
    response = Unit::Counterparty.delete_counterparty(counterparty_id: counterparty.data["id"])
    expect(response).to be_nil
  end
end
