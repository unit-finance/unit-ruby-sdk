# frozen_string_literal: true

# Params to list payments
# @see https://docs.unit.co/payments#list-payments

module Unit
  module Payment
    class ListPaymentParams
      attr_reader :limit, :offset, :account_id, :customer_id, :counterparty_account_id, :tags, :status, :type, :direction, :since, :_until, :from_amount, :to_amount, :recurring_payment_id, :feature, :sort, :include

      # @param limit [Integer] - optional
      # @param offset [Integer] - optional
      # @param account_id [String] - optional
      # @param customer_id [String] - optional
      # @param counterparty_account_id [String] - optional
      # @param tags [Hash] - optional
      # @param status [Array<String>] - optional
      # @param type [Array<String>] - optional
      # @param direction [Array<String>] - optional
      # @param since [String] - optional
      # @param _until [String] - optional
      # @param from_amount [Integer] - optional
      # @param to_amount [Integer] - optional
      # @param recurring_payment_id [String] - optional
      # @param feature [Array<String>] - optional
      # @param sort [String] - optional
      # @param include [Array<String>] - optional
      def initialize(limit = PAYMENT_LIMIT, offset = PAYMENT_OFFSET, account_id = nil, customer_id = nil,
                     counterparty_account_id = nil, tags = nil, status = nil,
                     type = nil, direction = nil, since = nil, _until = nil,
                     from_amount = nil, to_amount = nil, recurring_payment_id = nil,
                     feature = nil, sort = nil, include = nil)
        @limit = limit
        @offset = offset
        @account_id = account_id
        @customer_id = customer_id
        @counterparty_account_id = counterparty_account_id
        @tags = tags
        @status = status
        @type = type
        @direction = direction
        @since = since
        @until = until_
        @from_amount = from_amount
        @to_amount = to_amount
        @recurring_payment_id = recurring_payment_id
        @feature = feature
        @sort = sort
        @include = include
      end

      def to_hash
        params = {
          "page[limit]": limit,
          "page[offset]": offset,
          "filter[accountId]": account_id,
          "filter[customerId]": customer_id,
          "filter[counterpartyAccountId]": counterparty_account_id,
          "filter[tags]": tags,
          "filter[since]": since,
          "filter[until]": _until,
          "filter[fromAmount]": from_amount,
          "filter[toAmount]": to_amount,
          "filter[recurringPaymentId]": recurring_payment_id,
          sort: sort,
          include: include&.join(",")
        }
        filters = %i[status type direction feature]
        filters.each do |filter|
          values = send(filter)
          values&.each_with_index&.map do |val, index|
            params.merge!({ "filter[#{filter}][#{index}]": val })
          end
        end
        params.compact
      end
    end
  end
end
