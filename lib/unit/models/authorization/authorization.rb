# frozen_string_literal: true

module Unit
  module Authorization
    AUTHORIZATION_LIMIT = 100
    AUTHORIZATION_OFFSET = 0

    autoload :GetRequest, "unit/models/authorization/get_request"
    autoload :ListRequest, "unit/models/authorization/list_request"
    class << self
      # Get authorization by id
      # @see https://docs.unit.co/cards-authorizations#get-authorization-by-id
      # @param authorization_id [String]
      # @param include_non_authorized [Boolean] - optional
      def get_authorization(authorization_id:, include_non_authorized: nil)
        request = GetRequest.new(authorization_id, include_non_authorized)
        Unit::Resource::AuthorizationResource.get(request)
      end

      # List authorizations
      # @see https://docs.unit.co/cards-authorizations#list-authorizations
      # @param limit [Integer] - optional
      # @param offset [Integer] - optional
      # @param account_id [String] - optional
      # @param customer_id [String] - optional
      # @param card_id [String] - optional
      # @param since [String] - optional
      # @param until_ [String] - optional
      # @param include_non_authorized [Boolean] - optional
      # @param status [Array<String>] - optional
      # @param merchant_category_code [Array<String>] - optional
      # @param from_amount [Integer] - optional
      # @param to_amount [Integer] - optional
      # @param sort [String] - optional
      def list_authorizations(limit: AUTHORIZATION_LIMIT, offset: AUTHORIZATION_OFFSET, account_id: nil, customer_id: nil, card_id: nil, since: nil,
                              until_: nil, include_non_authorized: nil, status: nil, merchant_category_code: nil, from_amount: nil, to_amount: nil, sort: nil)
        request = ListRequest.new(limit, offset, account_id, customer_id, card_id, since, until_, include_non_authorized, status, merchant_category_code, from_amount, to_amount, sort)
        Unit::Resource::AuthorizationResource.list(request)
      end
    end
  end
end
