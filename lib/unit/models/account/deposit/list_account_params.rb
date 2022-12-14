# frozen_string_literal: true

# params for listing deposit accounts
# @see https://docs.unit.co/deposit-accounts#list-deposit-accounts
module Unit
  module Account
    module Deposit
      class ListAccountParams
        attr_reader :limit, :offset, :customer_id, :tags, :status,
                    :from_balance, :to_balance, :include

        # @param limit [Integer] - optional
        # @param offset [Integer] - optional
        # @param customer_id [String] - optional
        # @param tags [Array<String>] - optional
        # @param status [String] - optional
        # @param from_balance [Integer] - optional
        # @param to_balance [Integer] - optional
        # @param include [String] - optional
        def initialize(limit = ACCOUNT_LIST_LIMIT, offset = ACCOUNT_LIST_OFFSET, customer_id = nil, tags = nil,
                       status = nil, from_balance = nil, to_balance = nil, include = nil)
          @limit = limit
          @offset = offset
          @customer_id = customer_id
          @tags = tags
          @status = status
          @from_balance = from_balance
          @to_balance = to_balance
          @include = include
        end

        def to_hash
          params = { "page[limit]": limit,
                     "page[offset]": offset,
                     "filter[customerId]": customer_id,
                     "filter[tags]": tags,
                     "filter[fromBalance]": from_balance,
                     "filter[toBalance]": to_balance,
                     "include": include }
          params.to_json
        end
      end
    end
  end
end
