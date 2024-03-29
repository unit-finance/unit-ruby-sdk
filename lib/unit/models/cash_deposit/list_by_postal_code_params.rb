# frozen_string_literal: true

# Request to list cash deposits by postal code
# @see https://unit.co/docs/api/payments/cash-deposits/#list-cash-deposit-store-locations-by-postal-code
module Unit
  module CashDeposit
    class ListByPostalCodeParams
      attr_reader :limit, :offset, :postal_code, :service_type

      # @param postal_code [String]
      # @param limit [Integer] - optional
      # @param offset [Integer] - optional
      # @param service_type [String] - optional
      def initialize(postal_code, limit = CASH_DEPOSIT_LIMIT, offset = CASH_DEPOSIT_OFFSET,
                     service_type = nil)
        @limit = limit
        @offset = offset
        @postal_code = postal_code
        @service_type = service_type
      end

      def to_hash
        params = {
          "page[limit]": limit,
          "page[offset]": offset,
          "filter[postalCode]": postal_code,
          "filter[serviceType]": service_type
        }
        params.compact
      end
    end
  end
end
