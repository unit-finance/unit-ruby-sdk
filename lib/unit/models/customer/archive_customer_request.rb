# frozen_string_literal: true

# Request to archive customer
# See: https://docs.unit.co/customers#archive-customer
module Unit
  module Customer
    class ArchiveCustomerRequest
      attr_reader :customer_id, :reason

      # @param customer_id [String] The id of customer
      # @param optional reason [String] The reason for archiving the customer
      # @option reason [String] Need to be one of the following: Inactive, FraudACHActivity, FraudCardActivity, FraudCheckActivity, FraudApplicationHistory, FraudAccountActivity, FraudClientIdentified, FraudLinkedToFraudulentCustomer.
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
