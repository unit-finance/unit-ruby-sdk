# frozen_string_literal: true

# Request to list counterparties
# @see https://docs.unit.co/payments-counterparties/#list-counterparties
module Unit
  module Counterparty
    class ListCounterpartyParams
      attr_reader :limit, :offset, :customer_id, :account_number, :routing_number, :tags, :permissions

      # @param limit [Integer] - optional
      # @param offset [Integer] - optional
      # @param customer_id [String] - optional
      # @param account_number [String] - optional
      # @param routing_number [String] - optional
      # @param tags [Hash] - optional
      # @param permissions [Array<String>] - optional
      def initialize(limit = COUNTER_PARTY_LIMIT, offset = COUNTER_PARTY_OFFSET, customer_id = nil,
                     account_number = nil, routing_number = nil, tags = nil, permissions = nil)
        @limit = limit
        @offset = offset
        @customer_id = customer_id
        @account_number = account_number
        @routing_number = routing_number
        @tags = tags
        @permissions = permissions
      end

      def to_hash
        params =
          {
            "page[limit]": limit,
            "page[offset]": offset,
            "filter[customerId]": customer_id,
            "filter[accountNumber]": account_number,
            "filter[routingNumber]": routing_number,
            "filter[tags]": tags
          }
        permissions&.each_with_index&.map do |val, index|
          params.merge!({ "filter[permissions][#{index}]": val })
        end
        params.compact
      end
    end
  end
end
