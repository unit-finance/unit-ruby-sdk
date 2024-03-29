# frozen_string_literal: true

# class for approving the authorization request
# @see https://docs.unit.co/cards-authorization-requests/#approve-authorization-request
module Unit
  module AuthorizationRequest
    class ApproveRequest
      attr_reader :authorization_request_id, :amount, :funding_account, :tags

      # @param authorization_request_id [String]
      # @param amount [Integer] - optional
      # @param funding_account [String] - optional
      # @param tags [Hash] - optional
      def initialize(authorization_request_id, amount = nil, funding_account = nil, tags = nil)
        @authorization_request_id = authorization_request_id
        @amount = amount
        @funding_account = funding_account
        @tags = tags
      end

      def to_json_api
        payload = {
          data: {
            type: "approveAuthorizationRequest",
            attributes: {
              amount: amount,
              fundingAccount: funding_account,
              tags: tags
            }
          }
        }
        payload[:data][:attributes].compact!
        payload.to_json
      end
    end
  end
end
