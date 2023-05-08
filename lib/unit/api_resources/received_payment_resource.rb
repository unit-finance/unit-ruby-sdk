# frozen_string_literal: true

require_relative "./base_resource"
require_relative "../utils/http_helper"

# class for creating requests for book payments to Unit API and parsing responses
# @see https://docs.unit.co/book-payments#book-payments
module Unit
  module Resource
    class ReceivedPaymentResource < Unit::Resource::BaseResource
      class << self
        # Get a received ach payment by calling Unit's API
        # @param payment_id [String]
        # @return [UnitResponse, UnitError]
        def get_payment(payment_id)
          response = HttpHelper.get("#{api_url}/received-payments/#{payment_id}", headers: headers)
          response_handler(response)
        end

        # List received ach payments by calling Unit's API
        # @param params [ListAchPaymentParams]
        # @return [UnitResponse, UnitError]
        def list_payments(params = nil)
          response = HttpHelper.get("#{api_url}/received-payments", params: params&.to_hash, headers: headers)
          response_handler(response)
        end

        # Update a received ach payment by calling Unit's API
        # @param request [PatchReceivedPaymentRequest]
        # @return [UnitResponse, UnitError]
        def update_payment(request)
          payload = request.to_json_api
          response = HttpHelper.patch("#{api_url}/received-payments/#{request.payment_id}", body: payload, headers: headers)
          response_handler(response)
        end

        # Advance an ach payment by calling Unit's API
        # @param payment_id [String]
        # @return [UnitResponse, UnitError]
        def advance_received_payment(payment_id)
          response = HttpHelper.post("#{api_url}/received-payments/#{payment_id}/advance", headers: headers)
          response_handler(response)
        end
      end
    end
  end
end
