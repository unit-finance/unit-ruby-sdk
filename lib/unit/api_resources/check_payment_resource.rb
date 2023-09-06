# frozen_string_literal: true

require_relative "./base_resource"
require_relative "../utils/http_helper"
require "json"

# class for creating request for check payments to Unit API and parsing responses
# @see https://docs.unit.co/check-payments
module Unit
  module Resource
    class CheckPaymentResource < Unit::Resource::BaseResource
      class << self
        # Get a check payment by id by calling Unit's API
        # @param params [GetRequest]
        # @return [UnitResponse, UnitError]
        def get(params)
          payload = params.to_hash
          response = HttpHelper.get("#{api_url}/check-payments/#{params.payment_id}", params: payload, headers: headers)
          response_handler(response)
        end

        # Get a list of check payments by calling Unit's API
        # @param params [ListCheckPaymentParams]
        # @return [UnitResponse, UnitError]
        def list(params = nil)
          response = HttpHelper.get("#{api_url}/check-payments", params: params.to_hash, headers: headers)
          response_handler(response)
        end

        # Get a check payment image by calling Unit's API
        # @param request [GetImageRequest]
        # @return [UnitResponse, UnitError]
        def get_image(request)
          side = request.is_front_side ? "front" : "back"
          response = HttpHelper.get("#{api_url}/check-payments/#{request.payment_id}/#{side}", headers: headers, response_type: "image")
          file_response_handler(response)
        end

        # Return a check payment by calling Unit's API
        # @param request [ReturnCheckPaymentRequest]
        # @return [UnitResponse, UnitError]
        def return_payment(request)
          payload = request.to_json_api
          response = HttpHelper.post("#{api_url}/check-payments/#{request.payment_id}/return", body: payload, headers: headers)
          response_handler(response)
        end

        # Approve Check Payment Additional Verification by calling Unit's API
        # @param payment_id [String]
        # @return [UnitResponse, UnitError]
        def approve_payment_verification(payment_id)
          payload = { data: { type: "additionalVerification" } }.to_json
          response = HttpHelper.post("#{api_url}/check-payments/#{payment_id}/approve", body: payload, headers: headers)
          response_handler(response)
        end

        # Cancel check payment
        # @param payment_id [String]
        # @return [UnitResponse, UnitError]
        def cancel_payment(payment_id)
          response = HttpHelper.post("#{api_url}/check-payments/#{payment_id}/cancel", headers: headers)
          response_handler(response)
        end
      end
    end
  end
end
