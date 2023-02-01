# frozen_string_literal: true

require_relative "./base_resource"
require_relative "../utils/http_helper"
require "json"

# class for creating requests for counterparties to Unit API and parsing responses
# @see https://docs.unit.co/payments-counterparties
module Unit
  module Resource
    class CounterpartyResource < Unit::Resource::BaseResource
      class << self
        # Create a counterparty by calling Unit's API
        # @param request [CreateCounterpartyRequest, CreateWithPlaidTokenRequest]
        # @return [UnitResponse, UnitError]
        def create_counterparty(request)
          payload = request.to_json_api
          response = HttpHelper.post("#{api_url}/counterparties", body: payload, headers: headers)
          response_handler(response)
        end

        # Update counterparty by calling Unit's API
        # @param request [UpdateCounterpartyRequest]
        # @return [UnitResponse, UnitError]
        def update_counterparty(request)
          payload = request.to_json_api
          response = HttpHelper.patch("#{api_url}/counterparties/#{request.counterparty_id}", body: payload, headers: headers)
          response_handler(response)
        end

        # Delete counterparty by calling Unit's API
        # @param counterparty_id String
        # @return [UnitResponse, UnitError]
        def delete(counterparty_id)
          response = HttpHelper.delete("#{api_url}/counterparties/#{counterparty_id}", headers: headers, response_type: "delete")
          file_response_handler(response)
        end

        # Get counterparty by id by calling Unit's API
        # @param counterparty_id String
        # @return [UnitResponse, UnitError]
        def get_counterparty(counterparty_id)
          response = HttpHelper.get("#{api_url}/counterparties/#{counterparty_id}", headers: headers)
          response_handler(response)
        end

        # Get counterparty balance
        # @param counterparty_id String
        # @return [UnitResponse, UnitError]
        def get_counterparty_balance(counterparty_id)
          response = HttpHelper.get("#{api_url}/counterparties/#{counterparty_id}/balance", headers: headers)
          response_handler(response)
        end

        # List counterparties
        # @param params [ListCounterpartyParams]
        # @return [UnitResponse, UnitError]
        def list(params = nil)
          response = HttpHelper.get("#{api_url}/counterparties", params: params.to_hash, headers: headers)
          response_handler(response)
        end
      end
    end
  end
end
