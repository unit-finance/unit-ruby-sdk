# frozen_string_literal: true

# class for declining the authorization request
# @see https://docs.unit.co/cards-authorization-requests/#decline-authorization-request
module Unit
  module AuthorizationRequest
    class DeclineRequest
      attr_reader :authorization_request_id, :reason

      # @param authorization_request_id [String]
      # @param reason [String]
      def initialize(authorization_request_id, reason)
        @authorization_request_id = authorization_request_id
        @reason = reason
      end

      def to_json_api
        payload = {
          data: {
            type: "declineAuthorizationRequest",
            attributes: {
              reason: reason
            }
          }
        }
        payload[:data][:attributes].compact!
        payload.to_json
      end
    end
  end
end
