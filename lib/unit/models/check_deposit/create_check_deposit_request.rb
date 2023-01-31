# frozen_string_literal: true

# Request to create check deposit
# @see https://docs.unit.co/check-deposits#create-check-deposit
module Unit
  module CheckDeposit
    class CreateCheckDepositRequest
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
            "type": "checkDeposit",
            "attributes": {
              amount: amount,
              description: description,
              tags: tags,
              idempotency_key: idempotency_key
            },
            "relationships": {
              "account": Unit::Types::Relationship.new("account", account_id).to_hash
            }
          }
        }
        payload[:data][:attributes].compact!
        payload.to_json
      end
    end
  end
end
