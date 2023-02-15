# frozen_string_literal: true

# params for listing credit accounts
# @see https://docs.unit.co/credit-accounts/#list-credit-accounts
module Unit
  module Account
    module Credit
      class ListAccountParams
        attr_reader :limit, :offset, :customer_id, :tags, :status,
                    :from_balance, :to_balance, :include, :type

        # @param limit [Integer] - optional
        # @param offset [Integer] - optional
        # @param customer_id [String] - optional
        # @param tags [Hash] - optional
        # @param status [Array<String>] - optional
        # @param from_balance [Integer] - optional
        # @param to_balance [Integer] - optional
        # @param include [Array] - optional
        # @param type [String] - optional
        def initialize(limit = ACCOUNT_LIST_LIMIT, offset = ACCOUNT_LIST_OFFSET, customer_id = nil, tags = nil,
                       status = nil, from_balance = nil, to_balance = nil, include = nil, type = nil)
          @limit = limit
          @offset = offset
          @customer_id = customer_id
          @tags = tags
          @status = status
          @from_balance = from_balance
          @to_balance = to_balance
          @include = include
          @type = type
        end

        def to_hash
          params = { "page[limit]": limit,
                     "page[offset]": offset,
                     "filter[customerId]": customer_id,
                     "filter[tags]": tags,
                     "filter[fromBalance]": from_balance,
                     "filter[toBalance]": to_balance,
                     "filter[type]": type,
                     "include": include&.join(",") }
          status&.each_with_index&.map do |val, index|
            params.merge!({ "filter[status][#{index}]": val })
          end
          params.compact
        end
      end
    end
  end
end
