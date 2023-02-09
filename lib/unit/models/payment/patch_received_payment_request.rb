# frozen_string_literal: true

# Request to update a received ACH payment
# @see https://docs.unit.co/received-ach#update-received-payment
module Unit
  module Payment
    class PatchReceivedPaymentRequest
      attr_reader :payment_id, :tags

      # @param payment_id [String]
      # @param tags [Hash] - optional
      def initialize(payment_id, tags = nil)
        @payment_id = payment_id
        @tags = tags
      end

      def to_json_api
        payload = {
          "data": {
            "type": "achReceivedPayment",
            "attributes": {
              tags: tags
            }
          }
        }
        payload[:data][:attributes].compact!
        payload.to_json
      end
    end
  end
end
