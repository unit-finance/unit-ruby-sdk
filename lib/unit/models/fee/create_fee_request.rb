# frozen_string_literal: true

# Request to create fee
# @see https://docs.unit.co/fees/#create-fee
module Unit
  module Fee
    class CreateFeeRequest
      attr_reader :account_id, :amount, :description, :tags, :idempotency_key

      # @param account_id [String]
      # @param amount [Integer]
      # @param description [String]
      # @param tags [Hash] - optional
      # @param idempotency_key [String] - optional
      def initialize(account_id, amount, description, tags = nil, idempotency_key = nil)
        @account_id = account_id
        @amount = amount
        @description = description
        @tags = tags
        @idempotency_key = idempotency_key
      end

      def to_json_api
        payload = {
          "data": {
            "type": "fee",
            "attributes": {
              "amount": amount,
              "description": description,
              "tags": tags,
              "idempotencyKey": idempotency_key
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
