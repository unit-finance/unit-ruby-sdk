# frozen_string_literal: true

# Request to list cards
# @see https://docs.unit.co/cards#list-cards
module Unit
  module Card
    class ListCardParams
      attr_reader :limit, :offset, :account_id, :customer_id, :tags, :status, :include, :sort

      # @param limit [Integer] - optional
      # @param offset [Integer] - optional
      # @param account_id [String] - optional
      # @param customer_id [String] - optional
      # @param tags [String] - optional
      # @param status [Array<String>] - optional
      # @param include [Array] - optional
      # @param sort [String] - optional
      def initialize(limit = CARD_LIST_LIMIT, offset = CARD_LIST_OFFSET, account_id = nil,
                     customer_id = nil, tags = nil, status = nil, include = nil, sort = nil)
        @limit = limit
        @offset = offset
        @account_id = account_id
        @customer_id = customer_id
        @tags = tags
        @status = status
        @include = include
        @sort = sort
      end

      def to_hash
        params = { "page[limit]": limit,
                   "page[offset]": offset,
                   "filter[accountId]": account_id,
                   "filter[customerId]": customer_id,
                   "filter[tags]": tags,
                   "include": include&.join(","),
                   "sort": sort }
        status&.each_with_index&.map do |val, index|
          params.merge!({ "filter[status][#{index}]": val })
        end
        params.compact
      end
    end
  end
end
