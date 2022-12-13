# frozen_string_literal: true

module Unit
  module Customer
    CUSTOMER_LIST_LIMIT = 100
    CUSTOMER_LIST_OFFSET = 0

    autoload :AddAuthorizedUsersRequest, "unit/models/customer/add_authorized_users_request"
    autoload :ArchiveCustomerRequest, "unit/models/customer/archive_customer_request"
    autoload :ListCustomerParams, "unit/models/customer/list_customer_params"
    autoload :PatchBusinessCustomerRequest, "unit/models/customer/patch_business_customer_request"
    autoload :PatchIndividualCustomerRequest, "unit/models/customer/patch_individual_customer_request"
    autoload :RemoveAuthorizedUsersRequest, "unit/models/customer/remove_authorized_users_request"

    class << self
      # Update individual customer by calling Unit's API
      # @param customer_id [String]
      # @param address [Address] - optional
      # @param phone [Phone] - optional
      # @param email [String] - optional
      # @param dba [String] - optional
      # @param authorized_users [Array<AuthorizedUser>] - optional
      # @param tags [Hash] - optional
      # @param jwt_subject [String] - optional
      def update_individual_customer(customer_id:, address: nil, phone: nil, email: nil, dba: nil, authorized_users: nil, tags: nil, jwt_subject: nil)
        request = PatchIndividualCustomerRequest.new(customer_id, address, phone, email, dba, authorized_users, tags, jwt_subject)
        Unit::Resource::CustomerResource.update(request)
      end

      # Update business customer by calling Unit's API
      # @param customer_id [String]
      # @param address [Address] - optional
      # @param phone [Phone] - optional
      # @param contact [BusinessContact] - optional
      # @param authorized_users [Array<AuthorizedUser>] - optional
      # @param dba [String] - optional
      # @param tags [Hash] - optional
      # @return [UnitResponse, UnitError]
      def update_business_customer(customer_id:, address: nil, phone: nil, contact: nil, authorized_users: nil, dba: nil, tags: nil)
        request = PatchBusinessCustomerRequest.new(customer_id, address, phone, contact, authorized_users, dba, tags)
        Unit::Resource::CustomerResource.update(request)
      end

      # Get customer by calling Unit's API
      # @param customer_id [String]
      # @return [UnitResponse, UnitError]
      def get_customer(customer_id)
        Unit::Resource::CustomerResource.get(customer_id)
      end

      # List customers by calling Unit's API
      # @param limit [Integer] - optional
      # @param offset [Integer] - optional
      # @param query [String] - optional
      # @param email [String] - optional
      # @param tags [Hash] - optional
      # @param status [String] - optional
      # @param sort [String] - optional
      def list_customers(offset: CUSTOMER_LIST_OFFSET, limit: CUSTOMER_LIST_LIMIT, email: nil, tags: nil, status: nil, query: nil, sort: nil)
        request = ListCustomerParams.new(offset, limit, email, tags, status, query, sort)
        Unit::Resource::CustomerResource.list(request)
      end

      # Archive customer by calling Unit's API
      # @param customer_id [String]
      # @param reason [String] - optional
      def archive_customer(customer_id:, reason: nil)
        request = ArchiveCustomerRequest.new(customer_id, reason)
        Unit::Resource::CustomerResource.archive(request)
      end

      # Add authorized users by calling Unit's API
      # @param customer_id [String]
      # @param authorized_users [Array<AuthorizedUser>]
      def add_authorized_users(customer_id:, authorized_users:)
        request = AddAuthorizedUsersRequest.new(customer_id, authorized_users)
        Unit::Resource::CustomerResource.add_authorized_users(request)
      end

      # Remove authorized users by calling Unit's API
      # @param customer_id [String]
      # @param authorized_users [Array<AuthorizedUser>]
      def remove_authorized_users(customer_id:, authorized_users:)
        request = RemoveAuthorizedUsersRequest.new(customer_id, authorized_users)
        Unit::Resource::CustomerResource.remove_authorized_users(request)
      end
    end
  end
end
