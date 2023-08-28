# frozen_string_literal: true

require_relative "./base_resource"
require_relative "../utils/http_helper"
require "json"

# class for creating request for stop payments to Unit API and parsing responses
# @see https://docs.unit.co/stop-payments
module Unit
  module Resource
    class StopPaymentResource < Unit::Resource::BaseResource
      class << self
        # Create a stop payment by calling Unit's API
        # @param request [CreateStopPaymentRequest]
        # @return [UnitResponse, UnitError]
        def create_payment(request)
          payload = request.to_json_api
          response = HttpHelper.post("#{api_url}/stop-payments", body: payload, headers: headers)
          response_handler(response)
        end

        # Get a stop payment by calling Unit's API
        # @param payment_id [String]
        # @return [UnitResponse, UnitError]
        def get(payment_id)
          response = HttpHelper.get("#{api_url}/stop-payments/#{payment_id}", headers: headers)
          response_handler(response)
        end

        # Get a list of stop payments by calling Unit's API
        # @param params [ListStopPaymentParams]
        # @return [UnitResponse, UnitError]
        def list(params = nil)
          response = HttpHelper.get("#{api_url}/stop-payments", params: params.to_hash, headers: headers)
          response_handler(response)
        end

        # Disable a stop payment by calling Unit's API
        # @param payment_id [String]
        # @return [UnitResponse, UnitError]
        def disable_payment(payment_id)
          response = HttpHelper.post("#{api_url}/stop-payments/#{payment_id}/disable", headers: headers)
          response_handler(response)
        end
      end
    end
  end
end
