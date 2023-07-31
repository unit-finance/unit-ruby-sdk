# frozen_string_literal: true

# List authorizations
# @see https://docs.unit.co/cards-authorizations#list-authorizations
module Unit
  module Authorization
    class ListRequest
      attr_reader :limit, :offset, :account_id, :customer_id, :card_id, :since,
                  :until_, :include_non_authorized, :status, :merchant_category_code,
                  :from_amount, :to_amount, :sort

      # @param limit [Integer] - optional
      # @param offset [Integer] - optional
      # @param account_id [String] - optional
      # @param customer_id [String] - optional
      # @param card_id [String] - optional
      # @param since [String] - optional
      # @param until_ [String] - optional
      # @param include_non_authorized [Boolean] - optional
      # @param status [Array<String>] - optional
      # @param merchant_category_code [Array<String>] - optional
      # @param from_amount [Integer] - optional
      # @param to_amount [Integer] - optional
      # @param sort [String] - optional
      def initialize(limit = AUTHORIZATION_LIMIT, offset = AUTHORIZATION_OFFSET, account_id = nil, customer_id = nil, card_id = nil,
                     since = nil, until_ = nil, include_non_authorized = nil, status = nil, merchant_category_code = nil,
                     from_amount = nil, to_amount = nil, sort = nil)
        @limit = limit
        @offset = offset
        @account_id = account_id
        @customer_id = customer_id
        @card_id = card_id
        @since = since
        @until_ = until_
        @include_non_authorized = include_non_authorized
        @status = status
        @merchant_category_code = merchant_category_code
        @from_amount = from_amount
        @to_amount = to_amount
        @sort = sort
      end

      def to_hash
        payload = {
          "page[limit]": limit,
          "page[offset]": offset,
          "filter[accountId]": account_id,
          "filter[customerId]": customer_id,
          "filter[cardId]": card_id,
          "filter[since]": since,
          "filter[until]": until_,
          "filter[includeNonAuthorized]": include_non_authorized,
          "filter[fromAmount]": from_amount,
          "filter[toAmount]": to_amount,
          sort: sort
        }
        merchant_category_code&.each_with_index&.map do |val, index|
          params.merge!({ "filter[merchantCategoryCode][#{index}]": val })
        end
        status&.each_with_index&.map do |val, index|
          params.merge!({ "filter[status][#{index}]": val })
        end
        payload.compact
      end
    end
  end
end
