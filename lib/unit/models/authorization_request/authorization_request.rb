# frozen_string_literal: true

module Unit
  module AuthorizationRequest
    AUTHORIZATION_REQUEST_LIMIT = 100
    AUTHORIZATION_REQUEST_OFFSET = 0

    autoload :ApproveRequest, "unit/models/authorization_request/approve_request"
    autoload :DeclineRequest, "unit/models/authorization_request/decline_request"
    autoload :ListAuthorizationParams, "unit/models/authorization_request/list_authorization_params"
    class << self
      # get authorization request
      # @see https://docs.unit.co/cards-authorization-requests/#get-authorization-request-by-id
      # @param authorization_request_id [String]
      def get_authorization_request(authorization_request_id:)
        Unit::Resource::AuthorizationRequestResource.get_authorization_request(authorization_request_id)
      end

      # Approve authorization request
      # @see https://docs.unit.co/cards-authorization-requests/#approve-authorization-request
      # @param authorization_request_id [String]
      # @param amount [Integer] - optional
      # @param funding_account [String] - optional
      # @param tags [Hash] - optional
      def approve_authorization_request(authorization_request_id:, amount:, funding_account:, tags:)
        request = ApproveRequest.new(authorization_request_id, amount, funding_account, tags)
        Unit::Resource::AuthorizationRequestResource.approve(request)
      end

      # decline authorization request
      # @see https://docs.unit.co/cards-authorization-requests/#decline-authorization-request
      # @param authorization_request_id [String]
      # @param reason [String]
      def decline_authorization_request(authorization_request_id:, reason:)
        request = DeclineRequest.new(authorization_request_id, reason)
        Unit::Resource::AuthorizationRequestResource.decline(request)
      end

      # list params for the authorization request
      # @see https://docs.unit.co/cards-authorization-requests/#list-authorization-requests
      # @param limit [Integer] - optional
      # @param offset [Integer] - optional
      # @param account_id [String] - optional
      # @param customer_id [String] - optional
      # @param merchant_category_code [Array] - optional
      # @param from_amount [Integer] - optional
      # @param to_amount [Integer]- optional
      def list_authorization_requests(limit = AUTHORIZATION_REQUEST_LIMIT, offset = AUTHORIZATION_REQUEST_OFFSET,
                                      account_id: nil, customer_id: nil, merchant_category_code: nil, from_amount: nil, to_amount: nil)
        params = ListAuthorizationParams.new(limit, offset, account_id, customer_id, merchant_category_code, from_amount, to_amount)
        Unit::Resource::AuthorizationRequestResource.list(params)
      end
    end
  end
end
