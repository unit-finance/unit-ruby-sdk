# frozen_string_literal: true

# Request to list ach payments by calling Unit's API
# @see https://docs.unit.co/received-ach#list-received-payments
module Unit
  module Payment
    class ListAchPaymentParams
      attr_reader :limit, :offset, :account_id, :customer_id, :status,
                  :include_completed, :tags, :sort, :include

      # @param limit [Integer] - optional
      # @param offset [Integer] - optional
      # @param account_id [String] - optional
      # @param customer_id [String] - optional
      # @param status [Array<String>] - optional
      # @param include_completed [Boolean] - optional
      # @param tags [Hash] - optional
      # @param sort [String] - optional
      # @param include [Array<String>] - optional
      def initialize(limit = ACH_PAYMENT_LIMIT, offset = ACH_PAYMENT_OFFSET, account_id = nil, customer_id = nil, status = nil,
                     include_completed = nil, tags = nil, sort = nil, include = nil)
        @limit = limit
        @offset = offset
        @account_id = account_id
        @customer_id = customer_id
        @status = status
        @include_completed = include_completed
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
          "filter[includeCompleted]": include_completed,
          "filter[tags]": tags,
          "sort": sort,
          "include": include&.join(",")
        }
        status&.each_with_index&.map do |val, index|
          params.merge!({ "filter[status][#{index}]": val })
        end
        params.compact
      end
    end
  end
end
