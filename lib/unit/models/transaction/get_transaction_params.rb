# frozen_string_literal: true

# Request to get a transaction
# @see https://docs.unit.co/transactions#get-specific-transaction
module Unit
  module Transaction
    class GetTransactionParams
      attr_accessor :transaction_id, :account_id, :customer_id, :include

      # @param transaction_id [String]
      # @param account_id [String]
      # @param customer_id [String] - optional
      # @param include [Array<String>] - optional
      def initialize(transaction_id, account_id, customer_id = nil, include = nil)
        @transaction_id = transaction_id
        @account_id = account_id
        @customer_id = customer_id
        @include = include
      end

      def to_hash
        params = { "filter[customerId]": customer_id,
                   "include": include&.join(",") }
        params.compact
      end
    end
  end
end
