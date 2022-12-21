# frozen_string_literal: true

# Request to list transactions
# @see https://docs.unit.co/transactions#list-transactions
module Unit
  module Transaction
    class ListTransactionParams
      attr_reader :limit, :offset, :account_id, :customer_id, :query, :tags, :since, :_until, :card_id, :type, :from_amount, :to_amount, :direction, :exclude_fees, :sort, :include

      # @param limit [Integer] - optional
      # @param offset [Integer] - optional
      # @param account_id [String] - optional
      # @param customer_id [String] - optional
      # @param query [String] - optional
      # @param tags [String] - optional
      # @param since [String] - optional
      # @param _until [String] - optional
      # @param card_id [String] - optional
      # @param type [String] - optional
      # @param from_amount [String] - optional
      # @param to_amount [String] - optional
      # @param direction [String] - optional
      # @param exclude_fees [Boolean] - optional
      # @param sort [String] - optional
      # @param include [String] - optional
      def initialize(limit = TRANSACTION_LIST_LIMIT, offset = TRANSACTION_LIST_OFFSET, account_id = nil, customer_id = nil,
                     query = nil, tags = nil, since = nil, _until = nil, card_id = nil, type = nil, from_amount = nil, to_amount = nil,
                     direction = nil, exclude_fees = nil, sort = nil, include = nil)
        @limit = limit
        @offset = offset
        @account_id = account_id
        @customer_id = customer_id
        @query = query
        @tags = tags
        @since = since
        @_until = _until
        @card_id = card_id
        @type = type
        @from_amount = from_amount
        @to_amount = to_amount
        @direction = direction
        @exclude_fees = exclude_fees
        @sort = sort
        @include = include
      end

      def to_hash
        params = { "page[limit]": limit,
                   "page[offset]": offset,
                   "filter[accountId]": account_id,
                   "filter[customerId]": customer_id,
                   "filter[query]": query,
                   "filter[tags]": tags,
                   "filter[since]": since,
                   "filter[until]": _until,
                   "filter[cardId]": card_id,
                   "filter[type]": type,
                   "filter[fromAmount]": from_amount,
                   "filter[toAmount]": to_amount,
                   "filter[direction]": direction,
                   "excludeFees": exclude_fees,
                   "sort": sort,
                   "include": include }
        params.compact
      end
    end
  end
end
