# frozen_string_literal: true

require_relative "./base_resource"
require_relative "../utils/http_helper"

# class for creating requests for book payments to Unit API and parsing responses
# @see https://docs.unit.co/book-payments#book-payments
module Unit
  module Resource
    class PaymentResource < Unit::Resource::BaseResource
      class << self
        # Create a new book payment by calling Unit's API
        # @param request [CreatePaymentRequest]
        # @return [UnitResponse, UnitError]
        def create_payment(request)
          payload = request.to_json_api
          response = HttpHelper.post("#{api_url}/payments", body: payload, headers: headers)
          response_handler(response)
        end

        # Update a book payment by calling Unit's API
        # @param request [PatchBookPaymentRequest]
        # @return [UnitResponse, UnitError]
        def update_payment(request)
          payload = request.to_json_api
          response = HttpHelper.patch("#{api_url}/payments/#{request.payment_id}", body: payload, headers: headers)
          response_handler(response)
        end
      end
    end
  end
end
