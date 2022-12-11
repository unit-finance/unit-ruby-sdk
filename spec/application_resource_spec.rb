# frozen_string_literal: true

require_relative "./spec_helper"

RSpec.describe Unit::Resource::ApplicationResource do
  before do
    stub_const("FULL_NAME", Unit::Types::FullName.new("John", "Doe"))
    stub_const("ADDRESS", Unit::Types::Address.new("123 Main St", "San Francisco", "CA", "94205", "US"))
    stub_const("EMAIL", "so@gmail.com")
    stub_const("PHONE", Unit::Types::Phone.new("380", "555123222"))
    stub_const("APPLICATION_TYPES", %w[individualApplication businessApplication trustApplication].freeze)
    Unit.config({ api_url: "https://api.s.unit.sh", token: ENV["USER_TOKEN"] })
  end

  it "Should create business application" do
    request = create_business_application_request
    response = create_application(request)
    expect(response.data["type"]).to be "businessApplication"
  end

  it "Should create individual application" do
    request = create_individual_application_request
    response = create_application(request)
    expect(response.data["type"]).to be "individualApplication"
  end

  it "Should patch application" do
    request = patch_application_request
    response = patch_application(request)
    expect(response.data["type"]).to be "individualApplication"
  end

  it "Should get application" do
    response = get_application
    expect(response.data["type"]).to be "individualApplication"
  end

  it "Should list applications" do
    request = list_applications_request
    response = list_applications(request)
    response.data.each do |application|
      expect(application["type"]).to exist
    end
  end

  it "Should upload document" do
    request = upload_document_request
    response = upload_document(request)
    expect(response.data["type"]).to be "document"
  end
end
