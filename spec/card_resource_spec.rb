# frozen_string_literal: true

require_relative "./spec_helper"

RSpec.describe Unit::Card do
  before do
    configure_tests
  end

  describe "card creation" do
    let(:list_cards) { described_class.list_cards(limit: 10, offset: 0, status: %w[Active]) }
    let(:list_inactive_cards) { described_class.list_cards(limit: 10, offset: 0, status: %w[Inactive]) }
    let(:frozen_card_id) { described_class.list_cards(limit: 10, offset: 0, status: %w[Frozen]).data[0]["id"] }
    let(:create_deposit_account) { Unit::Account::Deposit.create_deposit_account(deposit_product: "checking", tags: { "purpose": "checking" }, relationships: RELATIONSHIPS) }
    let(:create_debit_response) { described_class.create_individual_debit_card(account_id: create_deposit_account.data["id"]) }
    let(:account_for_business) { Unit::Account::Deposit.create_deposit_account(deposit_product: "checking", tags: { "purpose": "checking" }, relationships: RELATIONSHIPS_BUSINESS).data["id"] }
    let(:business_debit_response) { described_class.create_business_debit_card(account_id: account_for_business, full_name: FULL_NAME, date_of_birth: DATE_OF_BIRTH, address: ADDRESS, phone: PHONE, email: EMAIL) }
    let(:business_virtual_response) { described_class.create_business_virtual_card(account_id: account_for_business, full_name: FULL_NAME, date_of_birth: DATE_OF_BIRTH, address: ADDRESS, phone: PHONE, email: EMAIL) }
    let(:create_virtual_response) { described_class.create_individual_virtual_card(account_id: create_deposit_account.data["id"]) }
    let(:activate_card_response) { described_class.activate(card_id: list_inactive_cards.data[2]["id"]) }

    it "creates an individual debit card" do
      expect(create_debit_response.data["type"]).to eq("individualDebitCard")
    end

    it "creates a business individual debit card" do
      expect(business_debit_response.data["type"]).to eq("businessDebitCard")
    end

    it "creates a business individual virtual card" do
      expect(business_virtual_response.data["type"]).to eq("businessVirtualDebitCard")
    end

    it "creates individual virtual card" do
      expect(create_virtual_response.data["type"]).to eq("individualVirtualDebitCard")
    end

    it "gets pin status" do
      response = described_class.get_pin_status(card_id: list_cards.data[1]["id"])
      expect(response.data["type"]).to eq("pinStatus")
    end

    it "reports stolen" do
      response = described_class.report_stolen(card_id: list_cards.data[2]["id"])
      expect(response.data["attributes"]["status"]).to eq("Stolen")
    end

    it "reports lost" do
      response = described_class.report_lost(card_id: list_cards.data[3]["id"])
      expect(response.data["attributes"]["status"]).to eq("Lost")
    end

    it "closes the card" do
      response = described_class.close_card(card_id: create_debit_response.data["id"])
      expect(response.data["type"]).to eq("individualDebitCard")
    end

    it "freezes the card" do
      response = described_class.freeze_card(card_id: list_cards.data[5]["id"])
      expect(response.data["attributes"]["status"]).to eq("Frozen")
    end

    it "unfreezes the card" do
      response = described_class.unfreeze_card(card_id: frozen_card_id)
      expect(response.data["attributes"]["status"]).to eq("Active")
    end

    it "replaces the card" do
      response = described_class.replace_card(card_id: create_debit_response.data["id"])
      expect(response.data["type"]).to eq("individualDebitCard")
    end

    it "gets card" do
      response = described_class.get_card(card_id: create_debit_response.data["id"])
      expect(response.data["type"]).to eq("individualDebitCard")
    end

    it "lists cards" do
      list_cards.data do |card|
        expect(card["type"]).to be_truthy
      end
    end
  end
end
