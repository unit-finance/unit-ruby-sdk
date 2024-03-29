# frozen_string_literal: true

require_relative "./base_resource"
require_relative "../utils/http_helper"

# class for creating requests for payments to Unit API and parsing responses
# @see https://docs.unit.co/book-payments#book-payments
# @see https://docs.unit.co/ach-origination
module Unit
  module Resource
    class PaymentResource < Unit::Resource::BaseResource
      class << self
        # Create a new payment by calling Unit's API
        # @param request [CreateAchPaymentInlineRequest, CreatePaymentLinkedRequest, CreateBookPaymentRequest, CreateWithPlaidTokenRequest, CreateWirePaymentRequest]
        # @return [UnitResponse, UnitError]
        def create_payment(request)
          payload = request.to_json_api
          response = HttpHelper.post("#{api_url}/payments", body: payload, headers: headers)
          response_handler(response)
        end

        # Create a new bulk payment by calling Unit's API
        # @param request [BulkPaymentRequest]
        # @return [UnitResponse, UnitError]
        def create_bulk_payment(request)
          response = HttpHelper.post("#{api_url}/payments/bulk", body: request, headers: headers)
          response_handler(response)
        end

        # Update a payment by calling Unit's API
        # @param request [PatchBookPaymentRequest, PatchAchPaymentRequest]
        # @return [UnitResponse, UnitError]
        def update_payment(request)
          payload = request.to_json_api
          response = HttpHelper.patch("#{api_url}/payments/#{request.payment_id}", body: payload, headers: headers)
          response_handler(response)
        end

        # Get a payment by calling Unit's API
        # @param request [GetRequest]
        # @return [UnitResponse, UnitError]
        def get_payment(request)
          payload = request.to_hash
          response = HttpHelper.get("#{api_url}/payments/#{request.payment_id}", params: payload, headers: headers)
          response_handler(response)
        end

        # List payments by calling Unit's API
        # @param request [ListPaymentParams]
        # @return [UnitResponse, UnitError]
        def list_payments(request)
          payload = request.to_hash
          response = HttpHelper.get("#{api_url}/payments", params: payload, headers: headers)
          response_handler(response)
        end

        # Create a new batch release by calling Unit's API
        # @param request [BatchReleaseRequestBuilder]
        # @return [UnitResponse, UnitError]
        def create_batch_release(request)
          payload = request.to_hash.to_json
          response = HttpHelper.post("#{api_url}/batch-releases", body: payload, headers: headers)
          response_handler(response)
        end
      end
    end
  end
end
