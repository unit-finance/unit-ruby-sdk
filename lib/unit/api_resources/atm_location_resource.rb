# frozen_string_literal: true

require_relative "./base_resource"
require_relative "../utils/http_helper"
require "json"

module Unit
  module Resource
    class AtmLocationResource < Unit::Resource::BaseResource
      class << self
        # Get a list of ATM locations by calling Unit's API
        # @param params [ListByCoordinatesParams, ListByAddressParams, ListByPostalCodeParams] The parameters to use to get a list of ATM locations
        # @return [Unit::Response] The response from Unit's API
        def list(params = nil)
          response = HttpHelper.get("#{api_url}/atm-locations", params: params.to_hash, headers: headers)
          response_handler(response)
        end
      end
    end
  end
end
