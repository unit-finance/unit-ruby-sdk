# frozen_string_literal: true

require_relative "./base_resource"
require_relative "../utils/http_helper"

# class for creating new API tokens' requests
# @see https://docs.unit.co/org-api-tokens
# @see https://docs.unit.co/customer-api-tokens
module Unit
  module Resource
    class ApiTokenResource < Unit::Resource::BaseResource
      class << self
        # Create a new Org API api_token by calling Unit's API
        # @param request [CreateApiTokenRequest]
        # @return [UnitResponse, UnitError]
        def create_org_api_token(request)
          payload = request.to_json_api
          response = HttpHelper.post("#{api_url}/users/#{request.user_id}/api-tokens", body: payload, headers: headers)
          response_handler(response)
        end

        # Get Org API tokens by calling Unit's API
        # @param user_id [String]
        # @return [UnitResponse, UnitError]
        def list_org_tokens(user_id)
          response = HttpHelper.get("#{api_url}/users/#{user_id}/api-tokens", headers: headers)
          response_handler(response)
        end

        # Revoke Org API api_token by calling Unit's API
        # @param user_id [String]
        # @param token_id [String]
        # @return [UnitResponse, UnitError]
        def revoke_org_token(user_id, token_id)
          response = HttpHelper.delete("#{api_url}/users/#{user_id}/api-tokens/#{token_id}", headers: headers)
          response_handler(response)
        end

        # Create customer token by calling Unit's API
        # @param [CreateCustomerTokenRequest, CreateCustomerTokenUsingJwtRequest] request
        # @return [UnitResponse, UnitError]
        def create_customer_token(request)
          payload = request.to_json_api
          response = HttpHelper.post("#{api_url}/customers/#{request.customer_id}/token", headers: headers, body: payload)
          response_handler(response)
        end

        # Create customer token verification by calling Unit's API
        # @param [CreateCustomerTokenVerification] request
        # @return [UnitResponse, UnitError]
        def create_token_verification(request)
          payload = request.to_json_api
          response = HttpHelper.post("#{api_url}/customers/#{request.customer_id}/token/verification", body: payload, headers: headers)
          response_handler(response)
        end
      end
    end
  end
end
