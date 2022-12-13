# frozen_string_literal: true

# Request to archive customer
# See: https://docs.unit.co/customers#archive-customer
module Unit
  module Customer
    class ArchiveCustomerRequest
      attr_reader :customer_id, :reason

      # @param customer_id [String]
      # @param reason [String] - optional
      def initialize(customer_id, reason = nil)
        @customer_id = customer_id
        @reason = reason
      end

      def to_json_api
        payload = {
          data: {
            type: "archiveCustomer",
            attributes: { reason: reason }
          }
        }
        payload[:data][:attributes].compact!
        payload.to_json
      end
    end
  end
end
