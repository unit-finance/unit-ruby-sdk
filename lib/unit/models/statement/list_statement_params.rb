# frozen_string_literal: true

# Request to list statements
# @see https://docs.unit.co/statements#list-statements
module Unit
  module Statement
    class ListStatementParams
      attr_reader :limit, :offset, :account_id, :customer_id, :period, :sort

      # @param limit [Integer] - optional
      # @param offset [Integer] - optional
      # @param account_id [String] - optional
      # @param customer_id [String] - optional
      # @param period [String] - optional
      # @param sort [String] - optional
      def initialize(limit = STATEMENT_LIST_LIMIT, offset = STATEMENT_LIST_OFFSET,
                     account_id = nil, customer_id = nil, period = nil, sort = nil)
        @limit = limit
        @offset = offset
        @account_id = account_id
        @customer_id = customer_id
        @period = period
        @sort = sort
      end

      def to_hash
        params = { "page[limit]": limit,
                   "page[offset]": offset,
                   "filter[accountId]": account_id,
                   "filter[customerId]": customer_id,
                   "filter[period]": period,
                   "sort": sort }
        params.compact
      end
    end
  end
end
