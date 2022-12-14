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
    stub_const("APPLICATION_TYPES", %w[individualApplication businessApplication trustApplication].freeze)
    stub_const("RELATIONSHIPS", { "customer": Unit::Types::Relationship.new("customer", "751009").represent })
    stub_const("OWNERS", Unit::Types::RelationshipArray.from_ids_array("customer", ["760553"]))
    stub_const("UNIT_API_URL", "https://api.s.unit.sh")
    stub_const("UNIT_TOKEN", ENV["USER_TOKEN"])
    Unit.config(api_url: UNIT_API_URL, token: UNIT_TOKEN)
  end

  def get_document_contents
    file = File.open("./spec/test.pdf", "rb")
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
