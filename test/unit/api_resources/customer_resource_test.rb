# frozen_string_literal: true

require "minitest/autorun"
require "unit/types/full_name"
require "unit/types/address"
require "unit/types/phone"
require "unit/types/business_contact"
require "unit/types/authorized_user"

require "unit/models/customers/patch_individual_customer_request"
require "unit/models/customers/patch_business_customer_request"
require "unit/models/customers/list_customer_params"
require "unit/models/customers/archive_customer_request"
require "unit/models/customers/add_authorized_users_request"
require "unit/models/customers/remove_authorized_users_request"
require "unit/api_resources/customer_resource"

class CustomerResourceTest < Minitest::Test
  FULL_NAME = FullName.new("John", "Doe")
  ADDRESS = Address.new("123 Main St", "San Francisco", "CA", "94205", "US")
  EMAIL = "so@gmail.com"
  PHONE = Phone.new("380", "555123222")
  CONTACT = BusinessContact.new(FULL_NAME, "jone.doe@unit-finance.com", PHONE)
  AUTHORIZED_USERS = [AuthorizedUser.new(FULL_NAME, EMAIL, PHONE), AuthorizedUser.new(FULL_NAME, "mfg@hotmail.com", PHONE)].freeze
  CUSTOMER_TYPES = %w[individualCustomer businessCustomer trustCustomer].freeze

  def customer_resource
    CustomerResource.new("https://api.s.unit.sh", ENV["USER_TOKEN"])
  end

  def update(request)
    customer_resource.update(request)
  end

  def test_update_individual_customer
    request = PatchIndividualCustomerRequest.new("733576", ADDRESS)
    response = update(request)
    assert_equal response.data["type"], "individualCustomer"
  end

  def test_update_business_customer
    request = PatchBusinessCustomerRequest.new("733565", ADDRESS, PHONE, CONTACT)
    response = update(request)
    assert_equal response.data["type"], "businessCustomer"
  end

  def get_customer(customer_id)
    customer_resource.get(customer_id)
  end

  def test_get_individual_customer
    response = get_customer("733576")
    assert_equal response.data["type"], "individualCustomer"
  end

  def test_get_business_customer
    response = get_customer("733565")
    assert_equal response.data["type"], "businessCustomer"
  end

  def list(params)
    customer_resource.list(params)
  end

  def test_list_customers
    request_params = ListCustomerParams.new(10, 0, "Richard")
    response = list(request_params)
    response.data.each do |customer|
      assert_equal CUSTOMER_TYPES.include?(customer["type"]), true
    end
  end

  def add_authorized_users(request)
    customer_resource.add_authorized_users(request)
  end

  def test_add_authorised_users
    request = AddAuthorizedUsersRequest.new("733565", AUTHORIZED_USERS)
    response = add_authorized_users(request)
    assert_equal response.data["type"], "businessCustomer"
  end

  def remove_authorized_users(request)
    customer_resource.remove_authorized_users(request)
  end

  def test_remove_authorised_users
    request = RemoveAuthorizedUsersRequest.new("733565", ["mfg@hotmail.com"])
    response = remove_authorized_users(request)
    assert_equal response.data["type"], "businessCustomer"
    assert_equal response.data["attributes"]["authorizedUsers"].length, 1
  end
end
