# frozen_string_literal: true

# Request to create a counterparty with plaid token
# @see https://docs.unit.co/payments-counterparties/#create-counterparty-with-plaid-token
module Unit
  module Counterparty
    class CreateWithPlaidTokenRequest
      attr_reader :customer_id, :type, :name, :plaid_processor_token,
                  :verify_name, :permissions, :tags, :idempotency_key

      # @param customer_id [String]
      # @param type [String]
      # @param name [String]
      # @param plaid_processor_token [String]
      # @param verify_name [Boolean] - optional
      # @param permissions [String] - optional
      # @param tags [Hash] - optional
      # @param idempotency_key [String] - optional
      def initialize(customer_id, type, name, plaid_processor_token, verify_name = nil, permissions = nil, tags = nil, idempotency_key = nil)
        @customer_id = customer_id
        @type = type
        @name = name
        @plaid_processor_token = plaid_processor_token
        @verify_name = verify_name
        @permissions = permissions
        @tags = tags
        @idempotency_key = idempotency_key
      end

      def to_json_api
        payload = {
          "data": {
            "type": "achCounterparty",
            "attributes": {
              type: type,
              name: name,
              plaidProcessorToken: plaid_processor_token,
              verifyName: verify_name,
              permissions: permissions,
              tags: tags,
              idempotencyKey: idempotency_key
            },
            "relationships": {
              customer: Unit::Types::Relationship.new("customer", customer_id).to_hash
            }
          }
        }
        payload[:data][:attributes].compact!
        payload.to_json
      end
    end
  end
end
