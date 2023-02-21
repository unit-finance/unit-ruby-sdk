# frozen_string_literal: true

require_relative "./base_resource"
require_relative "../utils/http_helper"
require "json"

# class for creating requests for transactions to Unit API and parsing responses
# @see https://docs.unit.co/transactions
module Unit
  module Resource
    class TransactionResource < Unit::Resource::BaseResource
      class << self
        # Get a transaction by id by calling Unit's API
        # @param params [GetTransactionParams]
        # @return [UnitResponse, UnitError]
        def get_transaction(params)
          response = HttpHelper.get("#{api_url}/accounts/#{params.account_id}/transactions/#{params.transaction_id}", params: params.to_hash, headers: headers)
          response_handler(response)
        end

        # Get transactions by calling Unit's API
        # @param params [ListTransactionParams]
        # @return [UnitResponse, UnitError]
        def list_transactions(params = nil)
          response = HttpHelper.get("#{api_url}/transactions", params: params.to_hash, headers: headers)
          response_handler(response)
        end

        # Update a transaction by calling Unit's API
        # @param request [PatchTagsRequest]
        # @return [UnitResponse, UnitError]
        def update_tags(request)
          payload = request.to_json_api
          response = HttpHelper.patch("#{api_url}/accounts/#{request.account_id}/transactions/#{request.transaction_id}", body: payload, headers: headers)
          response_handler(response)
        end

        # Update a transaction by calling Unit's API
        # @param request [PatchBookTransactionRequest, PatchChargeTransactionRequest]
        # @return [UnitResponse, UnitError]
        def update_transaction(request)
          payload = request.to_json_api
          response = HttpHelper.patch("#{api_url}/transactions/#{request.transaction_id}", body: payload, headers: headers)
          response_handler(response)
        end
      end
    end
  end
end
