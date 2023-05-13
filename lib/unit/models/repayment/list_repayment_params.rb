# frozen_string_literal: true

# Params for listing repayments
# @see https://docs.unit.co/repayments/#create-ach-repayment
module Unit
  module Repayment
    class ListRepaymentParams
      attr_reader :limit, :offset, :account_id, :credit_account_id,
                  :customer_id, :status, :type

      # @param limit [Integer] - optional
      # @param offset [Integer] - optional
      # @param account_id [String] - optional
      # @param credit_account_id [String] - optional
      # @param customer_id [String] - optional
      # @param status [Array<String>] - optional
      # @param type [Array<String>] - optional
      def initialize(limit = REPAYMENT_LIMIT, offset = REPAYMENT_OFFSET, account_id = nil,
                     credit_account_id = nil, customer_id = nil, status = nil, type = nil)
        @limit = limit
        @offset = offset
        @account_id = account_id
        @credit_account_id = credit_account_id
        @customer_id = customer_id
        @status = status
        @type = type
      end

      def to_hash
        params = {
          "page[limit]": limit,
          "page[offset]": offset,
          "filter[accountId]": account_id,
          "filter[creditAccountId]": credit_account_id,
          "filter[customerId]": customer_id
        }
        filters = %i[status type]
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
