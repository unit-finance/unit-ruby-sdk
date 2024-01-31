# frozen_string_literal: true

# list params for the authorization request
# @see https://docs.unit.co/cards-authorization-requests/#list-authorization-requests
module Unit
  module AuthorizationRequest
    class ListAuthorizationParams
      attr_reader :limit, :offset, :account_id, :customer_id, :merchant_category_code,
                  :from_amount, :to_amount

      # @param limit [Integer] - optional
      # @param offset [Integer] - optional
      # @param account_id [String] - optional
      # @param customer_id [String] - optional
      # @param merchant_category_code [Array] - optional
      # @param from_amount [Integer] - optional
      # @param to_amount [Integer]- optional
      def initialize(limit = AUTHORIZATION_REQUEST_LIMIT, offset = AUTHORIZATION_REQUEST_OFFSET,
                     account_id = nil, customer_id = nil, merchant_category_code = nil,
                     from_amount = nil, to_amount = nil)
        @limit = limit
        @offset = offset
        @account_id = account_id
        @customer_id = customer_id
        @merchant_category_code = merchant_category_code
        @from_amount = from_amount
        @to_amount = to_amount
      end

      def to_hash
        params = { "page[limit]": limit,
                   "page[offset]": offset,
                   "filter[accountId]": account_id,
                   "filter[customerId]": customer_id,
                   "filter[fromAmount]": from_amount,
                   "filter[toAmount]": to_amount }
        merchant_category_code&.each_with_index&.map do |val, index|
          params.merge!({ "filter[merchantCategoryCode][#{index}]": val })
        end
        params.compact
      end
    end
  end
end
