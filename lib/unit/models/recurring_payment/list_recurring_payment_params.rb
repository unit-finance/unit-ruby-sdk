# frozen_string_literal: true

# Params for listing recurring payments
# @see https://docs.unit.co/recurring-payments/#list-recurring-payments
module Unit
  module RecurringPayment
    class ListRecurringPaymentParams
      attr_reader :limit, :offset, :account_id, :customer_id, :status, :type,
                  :from_start_time, :to_start_time, :from_end_time, :to_end_time, :sort

      # @param limit [Integer] - optional
      # @param offset [Integer] - optional
      # @param account_id [String] - optional
      # @param customer_id [String] - optional
      # @param status [Array] - optional
      # @param type [Array] - optional
      # @param from_start_time [String] - optional
      # @param to_start_time [String] - optional
      # @param from_end_time [String] - optional
      # @param to_end_time [String] - optional
      # @param sort [String] - optional
      def initialize(limit = RECURRING_PAYMENT_LIMIT, offset = RECURRING_PAYMENT_OFFSET, account_id = nil, customer_id = nil, status = nil, type = nil,
                     from_start_time = nil, to_start_time = nil, from_end_time = nil, to_end_time = nil, sort = nil)
        @limit = limit
        @offset = offset
        @account_id = account_id
        @customer_id = customer_id
        @status = status
        @type = type
        @from_start_date = from_start_time
        @to_start_date = to_start_time
        @from_end_date = from_end_time
        @to_end_date = to_end_time
        @sort = sort
      end

      def to_hash
        payload = {
          "page[limit]": limit,
          "page[offset]": offset,
          "filter[accountId]": account_id,
          "filter[customerId]": customer_id,
          "filter[fromStartTime]": from_start_time,
          "filter[toStartTime]": to_start_time,
          "filter[fromEndTime]": from_end_time,
          "filter[toEndTime]": to_end_time,
          "sort": sort
        }
        filters = %i[status type]
        filters.each do |filter|
          values = send(filter)
          values&.each_with_index&.map do |val, index|
            params.merge!({ "filter[#{filter}][#{index}]": val })
          end
        end
        payload.compact!
      end
    end
  end
end
