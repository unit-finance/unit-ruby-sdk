# frozen_string_literal: true

require_relative "./spec_helper"

RSpec.describe Unit::Statement do
  before do
    configure_tests
  end

  describe "list statements" do
    it "should list statements" do
      response = described_class.list_statements(limit: 10, offset: 0)
      response.data.each do |statement|
        expect(statement["type"]).to be_truthy
      end
    end

    it "should get html by id" do
      response = described_class.get_html_by_id(statement_id: "9755166", customer_id: "22603", language: "en")
      p response
      expect(response).to include("html")
    end

    it "should get pdf by id" do
      response = described_class.get_pdf_by_id(statement_id: "9755166", customer_id: "22603", language: "en")
      expect(response).to include("PDF")
    end

    it "should get bank verification pdf" do
      response = described_class.get_bank_verification_pdf(account_id: "27573", include_proof_of_funds: true)
      expect(response).to include("PDF")
    end
  end
end
