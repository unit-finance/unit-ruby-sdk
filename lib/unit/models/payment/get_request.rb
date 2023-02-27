# frozen_string_literal: true

# Request to get payment by id
# @see https://docs.unit.co/payments#get-specific-payment
module Unit
  module Payment
    class GetRequest
      attr_reader :payment_id, :include

      # @param payment_id [String]
      # @param include [Array<String>] - optional
      def initialize(payment_id, include = nil)
        @payment_id = payment_id
        @include = include
      end

      def to_hash
        { include: include&.join(",") }.compact
      end
    end
  end
end
