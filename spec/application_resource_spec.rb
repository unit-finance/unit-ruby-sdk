# frozen_string_literal: true

require_relative "./spec_helper"

RSpec.describe Unit::Resource::ApplicationResource do
  def create_business_application_request
    business_contact = Unit::Types::BusinessContact.new(FULL_NAME, "jone.doe@unit-finance.com", PHONE)
    officer =Unit::Types::Officer.new(FULL_NAME, "1998-08-10", ADDRESS, PHONE, "jone.doe@unit-finance.com", "123456789")
    beneficial_owners = [
      Unit::Types::BeneficialOwner.new(FULL_NAME, "2001-08-10", ADDRESS, PHONE, "james@unit-finance.com",
                          "123456789"), Unit::Types::BeneficialOwner.new(FULL_NAME, "2001-08-10", ADDRESS, PHONE,
                                                            "james@unit-finance.com", "123456789")
    ]
    entity_type = "LLC"
    industry = "Retail"

    Unit::Application::CreateBusinessApplicationRequest.new("Acme Inc.", ADDRESS, PHONE, "CA", "123456789", industry,
                                         business_contact, officer, beneficial_owners, entity_type)
  end

  def create_application(request)
    Unit.config({api_url: "https://api.s.unit.sh", token: ENV["USER_TOKEN"]})
    described_class.create_application(request)
  end

  before do
    stub_const("FULL_NAME", Unit::Types::FullName.new("John", "Doe"))
    stub_const("ADDRESS", Unit::Types::Address.new("123 Main St", "San Francisco", "CA", "94205", "US"))
    stub_const("EMAIL", "so@gmail.com")
    stub_const("PHONE", Unit::Types::Phone.new("380", "555123222"))
    stub_const("APPLICATION_TYPES", %w[individualApplication businessApplication trustApplication].freeze)
  end

  it "Should create new instance" do
    application_resource = described_class.new("", "")
    expect(application_resource).to be_a Unit::Resource::ApplicationResource
  end

  it "Should create_business_application" do
    request = create_business_application_request
    response = create_application(request)
    expect(response).not_to be_a(Unit::UnitError)
    expect(response.data["type"]).to be "businessApplication"
  end
end
