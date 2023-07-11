# frozen_string_literal: true

# Request to return check payment by id
# @see https://docs.unit.co/check-payments#return-check-payment
module Unit
  module CheckPayment
    class ReturnCheckPaymentRequest
      attr_reader :payment_id, :return_reason_code

      # @param payment_id [String]
      # @param return_reason_code [String]
      def initialize(payment_id, return_reason_code)
        @payment_id = payment_id
        @return_reason_code = return_reason_code
      end

      def to_json_api
        payload = {
          data: {
            type: "checkPaymentReturn",
            attributes: { returnReasonCode: return_reason_code }
          }
        }
        payload[:data][:attributes].compact!
        payload.to_json
      end
    end
  end
end
