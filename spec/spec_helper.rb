# frozen_string_literal: true

require "rspec"
require "unit_ruby_sdk"

module Helpers
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

  def create_individual_application_request
    Unit::Application::CreateIndividualApplicationRequest.new(
      "123456789", FULL_NAME, Date.new(1989, 2, 1), ADDRESS, EMAIL, PHONE
    )
  end

  def create_application(request)
    Unit::Resource::ApplicationResource.create_application(request)
  end

  def patch_application_request
    Unit::Application::PatchApplicationRequest.new("824008", "individualApplication")
  end

  def list_applications_request
    Unit::Application::ListApplicationParams.new(0, 1, "richard@piedpiper.com")
  end

  def list_applications(request)
    Unit::Resource::ApplicationResource.list_applications(request)
  end

  def patch_application(request)
    Unit::Resource::ApplicationResource.update(request)
  end

  def get_application
    Unit::Resource::ApplicationResource.get_application(824_008)
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

  config.include Helpers
end
