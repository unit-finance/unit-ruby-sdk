# frozen_string_literal: true

require_relative "./base_resource"
require_relative "../utils/http_helper"
require "json"
# class for creating requests for authorizations to Unit API and parsing responses
# @see https://docs.unit.co/cards-authorizations
module Unit
  module Resource
    class AuthorizationResource < Unit::Resource::BaseResource
      class << self
        # Get authorization by calling Unit's API
        # @param params [GetRequest]
        # @return [UnitResponse, UnitError]
        def get(params)
          payload = params.to_hash
          response = HttpHelper.get("#{api_url}/authorizations/#{params.authorization_id}", params: payload, headers: headers)
          response_handler(response)
        end

        # Get authorization by calling Unit's API
        # @param params [GetRequest]
        # @return [UnitResponse, UnitError]
        def list(params = nil)
          response = HttpHelper.get("#{api_url}/authorizations", params: params&.to_hash, headers: headers)
          response_handler(response)
        end
      end
    end
  end
end
