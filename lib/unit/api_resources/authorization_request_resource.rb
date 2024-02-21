# frozen_string_literal: true

require_relative "./base_resource"
require_relative "../utils/http_helper"

# class for creating cards authorization requests
# @see https://docs.unit.co/cards-authorization-requests

module Unit
  module Resource
    class AuthorizationRequestResource < Unit::Resource::BaseResource
      class << self
        # Get authorization request by calling Unit's API
        # @param request_id [String]
        # @return [UnitResponse, UnitError]
        def get_authorization_request(request_id)
          response = HttpHelper.get("#{api_url}/authorization-requests/#{request_id}", headers: headers)
          response_handler(response)
        end

        # List authorization requests by calling Unit's API
        # @param params [ListAuthorizationParams]
        # @return [UnitResponse, UnitError]
        def list(params = nil)
          response = HttpHelper.get("#{api_url}/authorization-requests", params: params.to_hash, headers: headers)
          response_handler(response)
        end

        # Approve an authorization request by calling Unit's API
        # @param request [ApproveRequest]
        # @return [UnitResponse, UnitError]
        def approve(request)
          payload = request.to_json_api
          response = HttpHelper.post("#{api_url}/authorization-requests/#{request.authorization_request_id}/approve", body: payload, headers: headers)
          response_handler(response)
        end

        # Decline an authorization request by calling Unit's API
        # @param request [DeclineRequest]
        # @return [UnitResponse, UnitError]
        def decline(request)
          payload = request.to_json_api
          response = HttpHelper.post("#{api_url}/authorization-requests/#{request.authorization_request_id}/decline", body: payload, headers: headers)
          response_handler(response)
        end
      end
    end
  end
end
