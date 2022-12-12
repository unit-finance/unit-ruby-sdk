# frozen_string_literal: true

require_relative "./spec_helper"

RSpec.describe Unit::Resource::ApplicationResource do
  before do
    configure_tests
  end

  it "Should create business application" do
    request = Unit::Application::CreateBusinessApplicationRequest.new(
      BUSINESS_NAME,
      ADDRESS,
      PHONE,
      STATE,
      EIN,
      INDUSTRY,
      Unit::Types::BusinessContact.new(FULL_NAME, EMAIL, PHONE),
      Unit::Types::Officer.new(FULL_NAME, DATE_OF_BIRTH, ADDRESS, PHONE, EMAIL, SSN),
      [
        Unit::Types::BeneficialOwner.new(FULL_NAME, DATE_OF_BIRTH, ADDRESS, PHONE, EMAIL, SSN),
        Unit::Types::BeneficialOwner.new(FULL_NAME, DATE_OF_BIRTH, ADDRESS, PHONE, EMAIL, SSN)
      ],
      ENTITY_TYPE
    )

    response = described_class.create_application(request)
    expect(response.data["type"]).to eq "businessApplication"
  end

  it "Should create individual application" do
    request = Unit::Application::CreateIndividualApplicationRequest.new(
      "123456789", FULL_NAME, Date.new(1989, 2, 1), ADDRESS, EMAIL, PHONE
    )
    response = described_class.create_application(request)
    expect(response.data["type"]).to eq "individualApplication"
  end

  it "Should patch application" do
    request = Unit::Application::PatchApplicationRequest.new("824008", "individualApplication")
    response = described_class.update(request)
    expect(response.data["type"]).to eq "individualApplication"
  end

  it "Should get application" do
    response = described_class.get_application(824_008)
    expect(response.data["type"]).to eq "individualApplication"
  end

  it "Should list applications" do
    request = Unit::Application::ListApplicationParams.new(0, 1, "richard@piedpiper.com")
    response = described_class.list_applications(request)
    response.data.each do |application|
      expect(application["type"]).to exist
    end
  end

  it "Should upload document" do
    request = Unit::Application::UploadDocumentRequest.new("836683", "125215", get_document_contents, "pdf")
    response = described_class.upload(request)
    expect(response.data["type"]).to eq "document"
  end

  it "Should upload document back" do
    request = Unit::Application::UploadDocumentRequest.new("836683", "125214", get_document_contents, "pdf", true)
    response = described_class.upload(request)
    expect(response.data["type"]).to eq "document"
  end
end
