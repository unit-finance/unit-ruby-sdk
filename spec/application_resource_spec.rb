# frozen_string_literal: true

require "date"
require_relative "./spec_helper"

RSpec.describe Unit::Application do
  before do
    configure_tests
  end

  it "Should create business application" do
    response = described_class.create_business_application(
      name: BUSINESS_NAME,
      address: ADDRESS,
      phone: PHONE,
      state_of_incorporation: STATE,
      ein: EIN,
      industry: INDUSTRY,
      contact: Unit::Types::BusinessContact.new(FULL_NAME, EMAIL, PHONE),
      officer: Unit::Types::Officer.new(FULL_NAME, DATE_OF_BIRTH, ADDRESS, PHONE, EMAIL, SSN),
      beneficial_owners: [
        Unit::Types::BeneficialOwner.new(FULL_NAME, DATE_OF_BIRTH, ADDRESS, PHONE, EMAIL, SSN),
        Unit::Types::BeneficialOwner.new(FULL_NAME, DATE_OF_BIRTH, ADDRESS, PHONE, EMAIL, SSN)
      ],
      entity_type: ENTITY_TYPE
    )
    expect(response.data["type"]).to eq "businessApplication"
  end

  it "Should create individual application" do
    response = described_class.create_individual_application(
      ssn: "123456789", full_name: FULL_NAME, date_of_birth: Date.new(1989, 2, 1), address: ADDRESS, email: EMAIL, phone: PHONE,
      occupation: "ArchitectOrEngineer", annual_income: "UpTo10k", source_of_income: "EmploymentOrPayrollIncome"
    )
    expect(response.data["type"]).to eq "individualApplication"
  end

  it "Should create sole proprietor application" do
    response = described_class.create_sole_proprietor_application(
      nationality: "US", full_name: FULL_NAME, date_of_birth: Date.new(1989, 2, 1), address: ADDRESS, phone: PHONE,
      email: EMAIL, industry: "Retail",  ssn: "123456789", ein: "123456789", dba:  "Piedpiper Inc", power_of_attorney_agent: AGENT, evaluation_params: EVALUATION_PARAMS,
      occupation: "ArchitectOrEngineer", annual_income: "Between50kAnd100k", source_of_income:  "EmploymentOrPayrollIncome", annual_revenue: "Between100kAnd200k",
      number_of_employees: "Between5And10", business_vertical: "TechnologyMediaOrTelecom", website: "https://www.piedpiper.com", ip: "127.0.0.2",
      tags: { userId: "106a75e9-de77-4e25-9561-faffe59d7814" },
      idempotency_key: "3a1a33be-4e12-4603-9ed0-820922389fb8", device_fingerprints: DEVICE_FINGERPRINT, sole_proprietorship: true
    )
    expect(response.data["type"]).to eq "individualApplication"
  end

  it "Should patch application" do
    response = described_class.update_application(application_id: "824008", type: "individualApplication")
    expect(response.data["type"]).to eq "individualApplication"
  end

  it "Should get application" do
    response = described_class.get_application("824008")
    expect(response.data["type"]).to eq "individualApplication"
  end

  it "Should list applications" do
    response = described_class.list_applications(offset: 0, limit: 1)
    response.data.each do |application|
      expect(application["type"]).to be_truthy
    end
  end

  it "Should upload document" do
    response = described_class.upload_document(application_id: "836683", document_id: "125215", file: get_document_contents, file_type: "pdf")
    expect(response.data["type"]).to eq "document"
  end

  it "Should upload document back" do
    response = described_class.upload_document(application_id: "836683", document_id: "125214", file: get_document_contents, file_type: Unit::Types::DocumentFileType::PDF, is_back_side: true)
    expect(response.data["type"]).to eq "document"
  end
end
