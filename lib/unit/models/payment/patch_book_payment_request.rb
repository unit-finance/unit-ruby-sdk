# frozen_string_literal: true

# Request to update a book payment
# @see https://docs.unit.co/book-payments#update-book-payment
module Unit
  module Payment
    class PatchBookPaymentRequest
      attr_reader :payment_id, :tags

      # @param payment_id [String]
      # @param tags [Hash] - optional
      def initialize(payment_id, tags = nil)
        @payment_id = payment_id
        @tags = tags
      end

      def to_json_api
        payload = {
          data: {
            type: "bookPayment",
            attributes: {
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
