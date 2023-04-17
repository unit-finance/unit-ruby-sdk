# frozen_string_literal: true

require_relative "./base_resource"
require_relative "../utils/http_helper"

# class for creating requests for payments to Unit API and parsing responses
# @see https://docs.unit.co/book-payments#book-payments
# @see https://docs.unit.co/ach-origination
module Unit
  module Resource
    class FeeResource < Unit::Resource::BaseResource
      class << self
        # Create a new fee by calling Unit's API
        # @param request [CreateFeeRequest]
        # @return [UnitResponse, UnitError]
        def create_fee(request)
          payload = request.to_json_api
          response = HttpHelper.post("#{api_url}/fees", body: payload, headers: headers)
          response_handler(response)
        end

        # Reverse a fee by calling Unit's API
        # @param request [ReverseFeeRequest]
        # @return [UnitResponse, UnitError]
        def reverse_fee(request)
          payload = request.to_json_api
          response = HttpHelper.post("#{api_url}/fees/reverse", body: payload, headers: headers)
          response_handler(response)
        end
      end
    end
  end
end
