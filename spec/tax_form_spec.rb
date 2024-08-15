# frozen_string_literal: true

require_relative "./spec_helper"

RSpec.describe Unit::TaxForm do
  before do
    configure_tests
  end

  describe " tax forms" do
    let(:account_id) { Unit::Account::Deposit.create_deposit_account(deposit_product: "checking", tags: { "purpose": "checking" }, relationships: RELATIONSHIPS).data["id"] }
    let(:customer_id) { "9755166" }
    let(:tax_form_id) { "1" }

    # it "should list tax forms" do
    #   response = described_class.list_tax_forms(limit: 20, offset: 10)
    #   expect(response.data.first["type"]).to eq("taxForm")
    # end
    #
    # it "should get a tax form by id" do
    #   response = described_class.get_by_id(tax_form_id: "1")
    #   expect(response.data["type"]).to eq("taxForm")
    # end

    it "should get a tax form pdf by id and save it" do
      response = described_class.get_pdf_by_id(tax_form_id: "4")
      expect(response).to be_a(String)
      expect(response[0..3]).to eq("%PDF")
    end
  end
end
