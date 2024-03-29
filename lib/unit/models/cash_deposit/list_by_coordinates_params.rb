# frozen_string_literal: true

# Request to list cash deposits
# @see https://unit.co/docs/api/payments/cash-deposits/#list-cash-deposit-store-locations-by-coordinates
module Unit
  module CashDeposit
    class ListByCoordinatesParams
      attr_reader :limit, :offset, :coordinates, :service_type

      # @param coordinates [Coordinates]
      # @param limit [Integer] - optional
      # @param offset [Integer] - optional
      # @param service_type [String] - optional
      def initialize(coordinates, limit = CASH_DEPOSIT_LIMIT, offset = CASH_DEPOSIT_OFFSET,
                     service_type = nil)
        @limit = limit
        @offset = offset
        @coordinates = coordinates
        @service_type = service_type
      end

      def to_hash
        params = {
          "page[limit]": limit,
          "page[offset]": offset,
          "filter[coordinates]": coordinates.represent,
          "filter[serviceType]": service_type
        }
        params.compact
      end
    end
  end
end
