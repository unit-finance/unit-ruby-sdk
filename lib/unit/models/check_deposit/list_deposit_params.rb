# frozen_string_literal: true

# Request to list check deposits
# @see https://docs.unit.co/check-deposits#list-check-deposits
module Unit
  module CheckDeposit
    class ListDepositParams
      attr_reader :limit, :offset, :account_id, :customer_id, :tags, :sort, :include

      # @param limit [Integer] - optional
      # @param offset [Integer] - optional
      # @param account_id [String] - optional
      # @param customer_id [String] - optional
      # @param tags [Hash] - optional
      # @param sort [String] - optional
      # @param include [Array<String>] - optional
      def initialize(limit = CHECK_DEPOSIT_LIMIT, offset = CHECK_DEPOSIT_OFFSET, account_id = nil,
                     customer_id = nil, tags = nil, sort = nil, include = nil)
        @limit = limit
        @offset = offset
        @account_id = account_id
        @customer_id = customer_id
        @tags = tags
        @sort = sort
        @include = include
      end

      def to_hash
        params = {
          "page[limit]": limit,
          "page[offset]": offset,
          "filter[accountId]": account_id,
          "filter[customerId]": customer_id,
          "filter[tags]": tags,
          "sort": sort,
          "include": include&.join(",")
        }
        params.compact
      end
    end
  end
end
