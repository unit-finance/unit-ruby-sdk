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
    stub_const("AGENT", Unit::Types::PowerOfAttorneyAgent.new(FULL_NAME, "721074426", "US", DATE_OF_BIRTH, ADDRESS, PHONE, EMAIL))
    stub_const("EVALUATION_PARAMS", Unit::Types::EvaluationParams.new("ReplaceIdentification", true))
    stub_const("SSN", "123456789")
    stub_const("EIN", "123456789")
    stub_const("STATE", "CA")
    stub_const("ENTITY_TYPE", "LLC")
    stub_const("INDUSTRY", "Retail")
    stub_const("OFFICER", Unit::Types::Officer.new(FULL_NAME, DATE_OF_BIRTH, ADDRESS, PHONE, EMAIL, SSN))
    stub_const("BUSINESS_NAME", "Acme Inc.")
    stub_const("DEVICE_FINGERPRINT", [Unit::Types::DeviceFingerprint.new("ehndkkkkkkk113ndn")])
    stub_const("AUTHORIZED_USERS", [Unit::Types::AuthorizedUser.new(FULL_NAME, EMAIL, PHONE), Unit::Types::AuthorizedUser.new(FULL_NAME, EMAIL1, PHONE)])
    stub_const("CUSTOMER_TYPES", %w[individualCustomer businessCustomer trustCustomer])
    stub_const("BENEFICIAL_OWNERS", [Unit::Types::BeneficialOwner.new(FULL_NAME, DATE_OF_BIRTH, ADDRESS, PHONE, EMAIL, SSN).represent])
    stub_const("COUNTERPARTY", Unit::Types::Counterparty.new("Jane Doe", "27573", "812345678", "Checking"))
    stub_const("CHECK_PAYMENT_COUNTERPARTY", Unit::Types::CheckPaymentCounterparty.new("Jane Doe", ADDRESS))
    stub_const("WIRE_COUNTERPARTY", Unit::Types::WireCounterparty.new("Jane Doe", "27573", "812345678", ADDRESS))
    stub_const("APPLICATION_TYPES", %w[individualApplication businessApplication trustApplication].freeze)
    stub_const("APPLICATION_FORM_PREFILL", Unit::Types::ApplicationFormPrefill.new("Individual", FULL_NAME, SSN, nil, "US", DATE_OF_BIRTH, EMAIL, "Pied Piper", "DE", "Corporation", CONTACT, OFFICER, BENEFICIAL_OWNERS, "https://www.piedpiper.com", "Piedpiper Inc", "123456789", INDUSTRY, ADDRESS, PHONE))
    stub_const("SETTINGS_OVERRIDE", Unit::Types::ApplicationFormSettingsOverride.new("https://www.unit.co", "https://www.unit.co"))
    stub_const("REQUIRE_ID_VERIFICATION", Unit::Types::RequireIdVerification.new(false, false, true))
    stub_const("RELATIONSHIPS", { "customer": Unit::Types::Relationship.new("customer", "751009").to_hash })
    stub_const("RELATIONSHIPS_BUSINESS", { "customer": Unit::Types::Relationship.new("customer", "798787").to_hash })
    stub_const("OWNERS", %w[751009 760549])
    stub_const("RESTRICTED_RESOURCE", Unit::Types::RestrictedResource.new(["27573"], "account").to_json_api)
    stub_const("TRUSTEES", [Unit::Types::Trustee.new(FULL_NAME, SSN, EMAIL, PHONE, ADDRESS, DATE_OF_BIRTH).represent])
    stub_const("TRUST_CONTACT", Unit::Types::TrustContact.new(FULL_NAME, EMAIL, PHONE, ADDRESS))
    stub_const("GRANTOR", Unit::Types::Grantor.new(FULL_NAME, SSN, EMAIL, PHONE, ADDRESS, DATE_OF_BIRTH))
    stub_const("BENEFICIARIES", [Unit::Types::Beneficiary.new(FULL_NAME, DATE_OF_BIRTH).represent])
    stub_const("SCHEDULE", Unit::Types::CreateSchedule.new("Monthly", 3))
    stub_const("UNIT_API_URL", "https://api.s.unit.sh")
    stub_const("UNIT_TOKEN", ENV["USER_TOKEN"])
    Unit.config(api_url: UNIT_API_URL, token:
      "v2.public.eyJyb2xlIjoiYWRtaW4iLCJ1c2VySWQiOiI0MTQ4Iiwic3ViIjoic29sb21paWFAY29kaWZ5LmlvIiwiZXhwIjoiMjAyNC0wNC0wNVQxNTowMDo1Mi4zMzRaIiwianRpIjoiMjQwMDYxIiwib3JnSWQiOiIxMjYiLCJzY29wZSI6ImFwcGxpY2F0aW9ucyBhcHBsaWNhdGlvbnMtd3JpdGUgY3VzdG9tZXJzIGN1c3RvbWVycy13cml0ZSBjdXN0b21lci10YWdzLXdyaXRlIGN1c3RvbWVyLXRva2VuLXdyaXRlIGFjY291bnRzIGFjY291bnRzLXdyaXRlIGNhcmRzIGNhcmRzLXdyaXRlIGNhcmRzLXNlbnNpdGl2ZSBjYXJkcy1zZW5zaXRpdmUtd3JpdGUgdHJhbnNhY3Rpb25zIHRyYW5zYWN0aW9ucy13cml0ZSBhdXRob3JpemF0aW9ucyBzdGF0ZW1lbnRzIHBheW1lbnRzIHBheW1lbnRzLXdyaXRlIHBheW1lbnRzLXdyaXRlLWNvdW50ZXJwYXJ0eSBwYXltZW50cy13cml0ZS1saW5rZWQtYWNjb3VudCByZXBheW1lbnRzIHJlcGF5bWVudHMtd3JpdGUgcGF5bWVudHMtd3JpdGUtYWNoLWRlYml0IGNvdW50ZXJwYXJ0aWVzIGNvdW50ZXJwYXJ0aWVzLXdyaXRlIGJhdGNoLXJlbGVhc2VzIGJhdGNoLXJlbGVhc2VzLXdyaXRlIGxpbmtlZC1hY2NvdW50cyBsaW5rZWQtYWNjb3VudHMtd3JpdGUgd2ViaG9va3Mgd2ViaG9va3Mtd3JpdGUgZXZlbnRzIGV2ZW50cy13cml0ZSBhdXRob3JpemF0aW9uLXJlcXVlc3RzIGF1dGhvcml6YXRpb24tcmVxdWVzdHMtd3JpdGUgY2hlY2stZGVwb3NpdHMgY2hlY2stZGVwb3NpdHMtd3JpdGUgcmVjZWl2ZWQtcGF5bWVudHMgcmVjZWl2ZWQtcGF5bWVudHMtd3JpdGUgZGlzcHV0ZXMgY2hhcmdlYmFja3MgY2hhcmdlYmFja3Mtd3JpdGUgcmV3YXJkcyByZXdhcmRzLXdyaXRlIGNoZWNrLXBheW1lbnRzIGNoZWNrLXBheW1lbnRzLXdyaXRlIiwib3JnIjoiU0RLIiwic291cmNlSXAiOiIiLCJ1c2VyVHlwZSI6Im9yZyIsImlzVW5pdFBpbG90IjpmYWxzZX0TGgdwVspc91JV5-GKyFdQIvkO2PiwyP3GL2-IS6AT_4jHO4BqZ7uz18EsX7KGytTAJ9lRXrt7cQ2Y8LtpbPYL"
    )
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
