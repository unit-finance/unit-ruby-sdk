# frozen_string_literal: true

# Request to reverse a fee
# @see https://docs.unit.co/fees/#reverse-fee
module Unit
  module Fee
    class ReverseFeeRequest
      attr_reader :account_id, :transaction_id, :description, :tags, :idempotency_key

      # @param account_id [String]
      # @param transaction_id [Integer]
      # @param description [String]
      # @param tags [Hash] - optional
      # @param idempotency_key [String] - optional
      def initialize(account_id, transaction_id, description, tags = nil, idempotency_key = nil)
        @account_id = account_id
        @transaction_id = transaction_id
        @description = description
        @tags = tags
        @idempotency_key = idempotency_key
      end

      def to_json_api
        payload = {
          "data": {
            "type": "feeReversal",
            "attributes": {
              "description": description,
              "tags": tags,
              "idempotencyKey": idempotency_key
            },
            "relationships": {
              "account": Unit::Types::Relationship.new("depositAccount", account_id).to_hash,
              "transaction": Unit::Types::Relationship.new("transaction", transaction_id).to_hash
            }
          }
        }
        payload[:data][:attributes].compact!
        payload.to_json
      end
    end
  end
end
