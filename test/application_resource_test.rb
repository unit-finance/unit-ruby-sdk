# frozen_string_literal: true

require "minitest/autorun"
require "unit/types/full_name"
require "unit/types/address"
require "unit/types/phone"
require "unit/types/relationship"
require "unit/types/power_of_attorney_agent"
require "unit/types/business_contact"
require "unit/models/create_individual_application_request"
require "unit/models/create_business_application_request"
require "unit/models/patch_application_request"
require "unit/api_resources/application_resource"
require "unit/models/list_application_params"
require "unit/models/upload_document_request"

# Test the ApplicationResource class
class ApplicationResourceTest < Minitest::Test
  FULL_NAME = FullName.new("John", "Doe")
  ADDRESS = Address.new("123 Main St", "San Francisco", "CA", "94205", "US")
  EMAIL = "so@gmail.com"
  PHONE = Phone.new("380", "555123222")
  APPLICATION_TYPES = %w[individualApplication businessApplication trustApplication].freeze

  def test_create_business_application
    request = create_business_application_request
    response = create_application(request)
    assert_equal response.data["type"], "businessApplication"
  end

  def test_create_individual_application
    request = create_individual_application_request
    response = create_application(request)
    assert_equal response.data["type"], "individualApplication"
  end

  def create_individual_application_request
    CreateIndividualApplicationRequest.new(
      "123456789", FULL_NAME, Date.new(1989, 2, 1), ADDRESS, EMAIL, PHONE
    )
  end

  def create_business_application_request
    business_contact = BusinessContact.new(FULL_NAME, "jone.doe@unit-finance.com", PHONE)
    officer = Officer.new(FULL_NAME, "1998-08-10", ADDRESS, PHONE, "jone.doe@unit-finance.com", "123456789")
    beneficial_owners = [
      BeneficialOwner.new(FULL_NAME, "2001-08-10", ADDRESS, PHONE, "james@unit-finance.com",
                          "123456789"), BeneficialOwner.new(FULL_NAME, "2001-08-10", ADDRESS, PHONE,
                                                            "james@unit-finance.com", "123456789")
    ]
    entity_type = "LLC"
    CreateBusinessApplicationRequest.new("Acme Inc.", ADDRESS, PHONE, "CA", "123456789",
                                         business_contact, officer, beneficial_owners, entity_type)
  end

  def create_application(request)
    unit_api = ApplicationResource.new("https://api.s.unit.sh", ENV["USER_TOKEN"])
    unit_api.create_application(request)
  end

  def test_patch_application
    request = patch_application_request
    response = patch_application(request)
    assert_equal response.data["type"], "individualApplication"
  end

  def patch_application_request
    PatchApplicationRequest.new("824008", "individualApplication")
  end

  def patch_application(request)
    unit_api = ApplicationResource.new("https://api.s.unit.sh", ENV["USER_TOKEN"])
    unit_api.update(request)
  end

  def test_get_application
    response = get_application
    assert_equal response.data["type"], "individualApplication"
  end

  def get_application
    unit_api = ApplicationResource.new("https://api.s.unit.sh", ENV["USER_TOKEN"])
    unit_api.get_application(824_008)
  end

  def list_applications_request
    ListApplicationParams.new(0, 1, "richard@piedpiper.com")
  end

  def list_applications(request)
    unit_api = ApplicationResource.new("https://api.s.unit.sh", ENV["USER_TOKEN"])
    unit_api.list_applications(request)
  end

  def test_list_applications
    request = list_applications_request
    response = list_applications(request)
    response.data.each do |application|
      assert_equal APPLICATION_TYPES.include?(application["type"]), true
    end
  end

  def upload_document_request
    UploadDocumentRequest.new(824_034, 122_063, "resources/test.pdf", "pdf", false)
  end

  def upload_document_back_request
    UploadDocumentRequest.new(824_034, 122_063, "resources/test.pdf", "pdf", true)
  end

  def upload_document(request)
    unit_api = ApplicationResource.new("https://api.s.unit.sh", ENV["USER_TOKEN"])
    unit_api.upload(request)
  end

  def test_upload_document
    request = upload_document_request
    response = upload_document(request)
    assert_equal response.data["type"], "document"
  end

  def test_upload_document_back
    request = upload_document_back_request
    response = upload_document(request)
    assert_equal response.data["type"], "document"
  end
end
