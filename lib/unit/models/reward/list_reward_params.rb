# frozen_string_literal: true

# List reward params request
# @see https://docs.unit.co/rewards/#list-rewards
module Unit
  module Reward
    class ListRewardParams
      attr_reader :limit, :offset, :transaction_id, :rewarded_transaction_id,
                  :receiving_account_id, :customer_id, :card_id, :status, :since,
                  :until_, :tags, :sort, :include

      # @param limit [Integer] - optional
      # @param offset [Integer] - optional
      # @param transaction_id [String] - optional
      # @param rewarded_transaction_id [String] - optional
      # @param receiving_account_id [String] - optional
      # @param customer_id [String] - optional
      # @param card_id [String] - optional
      # @param status [String] - optional
      # @param since [String] - optional
      # @param until_ [String] - optional
      # @param tags [Hash] - optional
      # @param sort [String] - optional
      # @param include [Array<String>] - optional
      def initialize(limit = REWARD_LIMIT, offset = REWARD_OFFSET, transaction_id = nil, rewarded_transaction_id = nil,
                     receiving_account_id = nil, customer_id = nil, card_id = nil, status = nil, since = nil,
                     until_ = nil, tags = nil, sort = nil, include = nil)
        @limit = limit
        @offset = offset
        @transaction_id = transaction_id
        @rewarded_transaction_id = rewarded_transaction_id
        @receiving_account_id = receiving_account_id
        @customer_id = customer_id
        @card_id = card_id
        @status = status
        @since = since
        @until_ = until_
        @tags = tags
        @sort = sort
        @include = include
      end

      def to_hash
        params = {
          "page[limit]": limit,
          "page[offset]": offset,
          "filter[transactionId]": transaction_id,
          "filter[rewardedTransactionId]": rewarded_transaction_id,
          "filter[receivingAccountId]": receiving_account_id,
          "filter[customerId]": customer_id,
          "filter[cardId]": card_id,
          "filter[since]": since,
          "filter[until]": until_,
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
