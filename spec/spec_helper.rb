# frozen_string_literal: true

require "rspec"
require "unit_ruby_sdk"

module SpecHelper
  def configure_tests
    stub_const("FULL_NAME", Unit::Types::FullName.new("John", "Doe"))
    stub_const("EMAIL", "jone.doe@unit-finance.com")
    stub_const("EMAIL1", "april.doe@unit-finance.com")
    stub_const("DATE_OF_BIRTH", "1980-08-10")
    stub_const("ADDRESS", Unit::Types::Address.new("123 Main St", "San Francisco", "CA", "94205", "US"))
    stub_const("PHONE", Unit::Types::Phone.new("380", "555123222"))
    stub_const("CONTACT", Unit::Types::BusinessContact.new(FULL_NAME, EMAIL, PHONE))
    stub_const("SSN", "123456789")
    stub_const("EIN", "123456789")
    stub_const("STATE", "CA")
    stub_const("ENTITY_TYPE", "LLC")
    stub_const("INDUSTRY", "Retail")
    stub_const("BUSINESS_NAME", "Acme Inc.")
    stub_const("AUTHORIZED_USERS", [Unit::Types::AuthorizedUser.new(FULL_NAME, EMAIL, PHONE), Unit::Types::AuthorizedUser.new(FULL_NAME, EMAIL1, PHONE)])
    stub_const("CUSTOMER_TYPES", %w[individualCustomer businessCustomer trustCustomer])
    stub_const("COUNTERPARTY", Unit::Types::Counterparty.new("Jane Doe", "27573", "812345678", "Checking"))
    stub_const("WIRE_COUNTERPARTY", Unit::Types::WireCounterparty.new("Jane Doe", "27573", "812345678", ADDRESS))
    stub_const("APPLICATION_TYPES", %w[individualApplication businessApplication trustApplication].freeze)
    stub_const("RELATIONSHIPS", { "customer": Unit::Types::Relationship.new("customer", "751009").to_hash })
    stub_const("RELATIONSHIPS_BUSINESS", { "customer": Unit::Types::Relationship.new("customer", "798787").to_hash })
    stub_const("OWNERS", %w[751009 760549])
    stub_const("RESTRICTED_RESOURCE", Unit::Types::RestrictedResource.new(["27573"], "account").to_json_api)
    stub_const("UNIT_API_URL", "https://api.s.unit.sh")
    stub_const("UNIT_TOKEN",
               "v2.public.eyJyb2xlIjoiYWRtaW4iLCJ1c2VySWQiOiIzOTI2Iiwic3ViIjoiYWFsZXhzaGFuaStzZGstb3JnLWFkbWluQGdtYWlsLmNvbSIsImV4cCI6IjIwMjMtMTEtMjJUMTg6Mjc6MTEuODg0WiIsImp0aSI6IjE5ODczNyIsIm9yZ0lkIjoiMTI2Iiwic2NvcGUiOiJhcHBsaWNhdGlvbnMgYXBwbGljYXRpb25zLXdyaXRlIGN1c3RvbWVycyBjdXN0b21lcnMtd3JpdGUgY3VzdG9tZXItdGFncy13cml0ZSBjdXN0b21lci10b2tlbi13cml0ZSBhY2NvdW50cyBhY2NvdW50cy13cml0ZSBjYXJkcyBjYXJkcy13cml0ZSBjYXJkcy1zZW5zaXRpdmUgY2FyZHMtc2Vuc2l0aXZlLXdyaXRlIHRyYW5zYWN0aW9ucyB0cmFuc2FjdGlvbnMtd3JpdGUgYXV0aG9yaXphdGlvbnMgc3RhdGVtZW50cyBwYXltZW50cyBwYXltZW50cy13cml0ZSBwYXltZW50cy13cml0ZS1jb3VudGVycGFydHkgcmVwYXltZW50cyByZXBheW1lbnRzLXdyaXRlIHBheW1lbnRzLXdyaXRlLWFjaC1kZWJpdCBjb3VudGVycGFydGllcyBjb3VudGVycGFydGllcy13cml0ZSBiYXRjaC1yZWxlYXNlcyBiYXRjaC1yZWxlYXNlcy13cml0ZSB3ZWJob29rcyB3ZWJob29rcy13cml0ZSBldmVudHMgZXZlbnRzLXdyaXRlIGF1dGhvcml6YXRpb24tcmVxdWVzdHMgYXV0aG9yaXphdGlvbi1yZXF1ZXN0cy13cml0ZSBjaGVjay1kZXBvc2l0cyBjaGVjay1kZXBvc2l0cy13cml0ZSByZWNlaXZlZC1wYXltZW50cyByZWNlaXZlZC1wYXltZW50cy13cml0ZSBkaXNwdXRlcyBjaGFyZ2ViYWNrcyBjaGFyZ2ViYWNrcy13cml0ZSByZXdhcmRzIHJld2FyZHMtd3JpdGUiLCJvcmciOiJTREsiLCJzb3VyY2VJcCI6IiIsInVzZXJUeXBlIjoib3JnIiwiaXNVbml0UGlsb3QiOmZhbHNlfX1x4NdmBL3qyWdwrjlZVOGWnNvHF5QTCG4oYDd4Uf3xQq_L9W3tNw_YpFjuuQZwg767yuezWZisI-HqUOTw-A0")
    Unit.config(api_url: UNIT_API_URL, token: UNIT_TOKEN)
  end

  def get_document_contents
    file = File.open("./spec/test.pdf", "rb")
    contents = file.read
    file.close
    contents
  end

  def get_image_contents
    file = File.open("./spec/check.jpg", "rb")
    contents = file.read
    file.close
    contents
  end
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.include SpecHelper
end
