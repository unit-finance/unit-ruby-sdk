# frozen_string_literal: true

require_relative "./base_resource"
require_relative "../utils/http_helper"

# class for creating requests for payments to Unit API and parsing responses
# @see https://docs.unit.co/recurring-payments
module Unit
  module Resource
    class RecurringPaymentResource < Unit::Resource::BaseResource
      class << self
        # Create a new recurring payment by calling Unit's API
        # @param request [CreateRecurringCreditAchPaymentRequest, CreateRecurringDebitAchPaymentRequest, CreateRecurringCreditBookPaymentRequest]
        # @return [UnitResponse, UnitError]
        def create_recurring_payment(request)
          payload = request.to_json_api
          response = HttpHelper.post("#{api_url}/recurring-payments", body: payload, headers: headers)
          response_handler(response)
        end

        # Disable a new recurring payment by calling Unit's API
        # @param recurring_payment_id [String]
        # @return [UnitResponse, UnitError]
        def disable_recurring_payment(recurring_payment_id)
          response = HttpHelper.post("#{api_url}/recurring-payments/#{recurring_payment_id}/disable", headers: headers)
          response_handler(response)
        end

        # Enable a new recurring payment by calling Unit's API
        # @param recurring_payment_id [String]
        # @return [UnitResponse, UnitError]
        def enable_recurring_payment(recurring_payment_id)
          response = HttpHelper.post("#{api_url}/recurring-payments/#{recurring_payment_id}/enable", headers: headers)
          response_handler(response)
        end

        # List a new recurring payment by calling Unit's API
        # @param request [ListRecurringPaymentParams]
        # @return [UnitResponse, UnitError]
        def list_recurring_payment(params = {})
          response = HttpHelper.get("#{api_url}/recurring-payments", params: params.to_hash, headers: headers)
          response_handler(response)
        end

        # Get a new recurring payment by calling Unit's API
        # @param recurring_payment_id [String]
        # @return [UnitResponse, UnitError]
        def get_recurring_payment(recurring_payment_id)
          response = HttpHelper.get("#{api_url}/recurring-payments/#{recurring_payment_id}", headers: headers)
          response_handler(response)
        end
      end
    end
  end
end
