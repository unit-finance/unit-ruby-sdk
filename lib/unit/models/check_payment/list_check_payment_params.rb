# frozen_string_literal: true

# Request to list check payments
# @see https://docs.unit.co/check-payments#list-check-payments
module Unit
  module CheckPayment
    class ListPaymentParams
      attr_reader :limit, :offset, :account_id, :customer_id, :tags, :sort,
                  :since, :_until, :status, :from_amount, :to_amount, :check_number, :include

      # @param limit [Integer] - optional
      # @param offset [Integer] - optional
      # @param account_id [String] - optional
      # @param customer_id [String] - optional
      # @param tags [Hash] - optional
      # @param sort [String] - optional
      # @param since [String] - optional
      # @param _until [String] - optional
      # @param status [Array<String>] - optional
      # @param from_amount [String] - optional
      # @param to_amount [String] - optional
      # @param check_number [String] - optional
      # @param include [Array<String>] - optional
      def initialize(limit = CHECK_PAYMENT_LIMIT, offset = CHECK_PAYMENT_OFFSET, account_id = nil,
                     customer_id = nil, tags = nil, sort = nil, since = nil, _until = nil, status = nil, from_amount = nil,
                     to_amount = nil, check_number = nil, include = nil)
        @limit = limit
        @offset = offset
        @account_id = account_id
        @customer_id = customer_id
        @tags = tags
        @sort = sort
        @since = since
        @until = _until
        @status = status
        @from_amount = from_amount
        @to_amount = to_amount
        @check_number = check_number
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
          "filter[since]": since,
          "filter[until]": _until,
          "filter[fromAmount]": from_amount,
          "filter[toAmount]": to_amount,
          "filter[checkNumber]": check_number,
          "include": include&.join(",")
        }
        status&.each_with_index&.map do |val, index|
          params.merge!({ "filter[status][#{index}]": val })
        end
      end
    end
  end
end
