# frozen_string_literal: true

# Request to create a stop payment
# @see https://docs.unit.co/stop-payments#create-stop-payment
module Unit
  module StopPayment
    class CreateStopPaymentRequest
      attr_reader :account_id, :amount, :check_number, :tags, :idempotency_key

      # @param account_id [String]
      # @param amount [Integer]
      # @param check_number [String]
      # @param tags [Hash] - optional
      # @param idempotency_key [String] - optional
      def initialize(account_id, amount, check_number, tags = nil, idempotency_key = nil)
        @account_id = account_id
        @amount = amount
        @check_number = check_number
        @tags = tags
        @idempotency_key = idempotency_key
      end

      def to_json_api
        payload = {
          data: {
            type: "stopPayment",
            attributes: {
              amount: amount,
              checkNumber: check_number,
              tags: tags,
              idempotencyKey: idempotency_key
            },
            "relationships": {
              "account": Unit::Types::Relationship.new("depositAccount", account_id).to_hash
            }
          }
        }
        payload[:data][:attributes].compact!
        payload.to_json
      end
    end
  end
end
