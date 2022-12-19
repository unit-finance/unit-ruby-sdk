# frozen_string_literal: true

# Request to add or remove owners to a deposit account
# @see https://docs.unit.co/deposit-accounts#account-add-owners
# @see https://docs.unit.co/deposit-accounts#account-remove-owners
module Unit
  module Account
    module Deposit
      class AccountOwnersRequest
        attr_reader :account_id, :customers

        # @param account_id [String]
        # @param customers [Array<String>]
        def initialize(account_id, customers)
          @account_id = account_id
          @customers = customers
        end

        def to_json_api
          customers_hash = customers.map do |customer|
            { "type": "customer", "id": customer }
          end
          result = { data: customers_hash }
          result.to_json
        end
      end
    end
  end
end
