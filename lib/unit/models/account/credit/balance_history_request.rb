# frozen_string_literal: true

# Request to get the balance history of a credit account
# @see https://docs.unit.co/credit-accounts/#get-account-balance-history
module Unit
  module Account
    module Credit
      class BalanceHistoryRequest
        attr_reader :limit, :offset, :account_id, :customer_id, :since, :_until

        # @param limit [Integer] - optional
        # @param offset [Integer] - optional
        # @param account_id [String] - optional
        # @param customer_id [String] - optional
        # @param since [String] - optional
        # @param _until [String] - optional
        def initialize(limit = BALANCE_HISTORY_LIMIT, offset = BALANCE_HISTORY_OFFSET, account_id = nil, customer_id = nil,
                       since = nil, _until = nil)
          @limit = limit
          @offset = offset
          @account_id = account_id
          @customer_id = customer_id
          @since = since
          @_until = _until
        end

        def to_hash
          params = { "page[limit]": limit,
                     "page[offset]": offset,
                     "filter[accountId]": account_id,
                     "filter[customerId]": customer_id,
                     "filter[since]": since,
                     "filter[until]": _until }
          params.compact
        end
      end
    end
  end
end
