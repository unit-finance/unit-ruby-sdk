# frozen_string_literal: true

# Request to get a check deposit image
# @see https://docs.unit.co/check-payments#get-specific-check-payment-front-image
# @see https://docs.unit.co/check-payments#get-specific-check-payment-back-image
module Unit
  module CheckPayment
    class GetImageRequest
      attr_reader :payment_id, :is_front_side

      # @param payment_id [String]
      # @param is_front_side [Boolean] - optional
      def initialize(payment_id, is_front_side: true)
        @payment_id = payment_id
        @is_front_side = is_front_side
      end
    end
  end
end
