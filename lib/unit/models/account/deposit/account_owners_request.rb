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
        # @param customers [Array<Customer>]
        def initialize(account_id, customers)
          @account_id = account_id
          @customers = customers
        end

        def to_json_api
          customers.to_json
        end
      end
    end
  end
end
