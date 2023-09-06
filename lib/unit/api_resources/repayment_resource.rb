# frozen_string_literal: true

# frozen_string_literal: true

require_relative "./base_resource"
require_relative "../utils/http_helper"

# class for creating requests for repayments to Unit API and parsing responses
# @see https://docs.unit.co/repayments
module Unit
  module Resource
    class RepaymentResource < Unit::Resource::BaseResource
      class << self
        # Get a repayment by calling Unit's API
        # @param request [GetRequest]
        # @return [UnitResponse, UnitError]
        def get(repayment_id)
          response = HttpHelper.get("#{api_url}/repayments/#{repayment_id}", headers: headers)
          response_handler(response)
        end

        # List repayments by calling Unit's API
        # @param request [ListRepaymentParams]
        # @return [UnitResponse, UnitError]
        def list(params = nil)
          response = HttpHelper.get("#{api_url}/repayments", params: params&.to_hash, headers: headers)
          response_handler(response)
        end

        # Create a repayment by calling Unit's API
        # @param request [CreateAchRepaymentRequest, CreateBookRepaymentRequest]
        # @return [UnitResponse, UnitError]
        def create(request)
          payload = request.to_json_api
          response = HttpHelper.post("#{api_url}/repayments", body: payload, headers: headers)
          response_handler(response)
        end
      end
    end
  end
end
