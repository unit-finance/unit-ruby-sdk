# frozen_string_literal: true

require_relative "./base_resource"
require_relative "../utils/http_helper"
require "json"

# class for creating request for accounts to Unit API and parsing responses
# @see https://docs.unit.co/#accounts
module Unit
  module Resource
    class AccountResource < Unit::Resource::BaseResource
      class << self
        # Create a new account by calling Unit's API
        # @param request [CreateDepositAccountRequest] request
        # @return [UnitResponse, UnitError]
        def create_account(request)
          payload = request.to_json_api
          response = HttpHelper.post("#{api_url}/accounts", body: payload, headers: headers)
          response_handler(response)
        end

        # Close an account by calling Unit's API
        # @param request [CloseDepositAccountRequest] request
        # @return [UnitResponse, UnitError]
        def close_account(request)
          payload = request.to_json_api
          response = HttpHelper.post("#{api_url}/accounts/#{request.account_id}/close", body: payload, headers: headers)
          response_handler(response)
        end

        # Reopen an account by calling Unit's API
        # @param account_id [String]
        # @param reason [String]
        # @return [UnitResponse, UnitError]
        def reopen_account(account_id)
          response = HttpHelper.post("#{api_url}/accounts/#{account_id}/reopen", headers: headers)
          response_handler(response)
        end

        # Freeze an account by calling Unit's API
        # @param request [FreezeAccountRequest]
        # @return [UnitResponse, UnitError]
        def freeze_account(request)
          payload = request.to_json_api
          response = HttpHelper.post("#{api_url}/accounts/#{request.account_id}/freeze", body: payload, headers: headers)
          response_handler(response)
        end

        # Unfreeze an account by calling Unit's API
        # @param account_id [String]
        # @return [UnitResponse, UnitError]
        def unfreeze_account(account_id)
          response = HttpHelper.post("#{api_url}/accounts/#{account_id}/unfreeze", headers: headers)
          response_handler(response)
        end

        # Get account by calling Unit's API
        # @param account_id [String]
        # @return [UnitResponse, UnitError]
        def get_account(account_id)
          response = HttpHelper.get("#{api_url}/accounts/#{account_id}", headers: headers)
          response_handler(response)
        end

        # List accounts by calling Unit's API
        # @param params [ListAccountParams] - optional
        # @return [UnitResponse, UnitError]
        def list_accounts(params = nil)
          response = HttpHelper.get("#{api_url}/accounts", params: params.to_hash, headers: headers)
          response_handler(response)
        end

        # Update account by calling Unit's API
        # @param request [PatchDepositAccountRequest]
        def update_account(request)
          payload = request.to_json_api
          response = HttpHelper.patch("#{api_url}/accounts/#{request.account_id}", body: payload, headers: headers)
          response_handler(response)
        end

        # Limit account by calling Unit's API
        # @param account_id [String]
        # @return [UnitResponse, UnitError]
        def limits(account_id)
          response = HttpHelper.get("#{api_url}/accounts/#{account_id}/limits", headers: headers)
          response_handler(response)
        end

        # Get deposit products by calling Unit's API
        # @param account_id [String]
        # @return [UnitResponse, UnitError]
        def get_deposit_products(account_id)
          response = HttpHelper.get("#{api_url}/accounts/#{account_id}/deposit-products", headers: headers)
          response_handler(response)
        end

        # Get account balance history by calling Unit's API
        # @param params [BalanceHistoryRequest]
        # @return [UnitResponse, UnitError]
        def get_account_balance_history(params)
          response = HttpHelper.get("#{api_url}/account-end-of-day", params: params.to_hash, headers: headers)
          response_handler(response)
        end

        # Add account owners by calling Unit's API
        # @param request [AccountOwnersRequest]
        # @return [UnitResponse, UnitError]
        def add_owners(request)
          payload = request.to_json_api
          response = HttpHelper.post("#{api_url}/accounts/#{request.account_id}/relationships/customers", body: payload, headers: headers)
          response_handler(response)
        end

        # Remove account owners by calling Unit's API
        # @param request [AccountOwnersRequest]
        # @return [UnitResponse, UnitError]
        def remove_owners(request)
          payload = request.to_json_api
          response = HttpHelper.delete("#{api_url}/accounts/#{request.account_id}/relationships/customers", body: payload, headers: headers)
          response_handler(response)
        end
      end
    end
  end
end
