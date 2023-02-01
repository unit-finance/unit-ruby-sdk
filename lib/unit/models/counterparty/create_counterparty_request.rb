# frozen_string_literal: true

# Request to create a counterparty
# @see https://docs.unit.co/payments-counterparties/#create-counterparty
module Unit
  module Counterparty
    class CreateCounterpartyRequest
      attr_reader :customer_id, :name, :routing_number, :account_number, :account_type,
                  :type, :tags, :permissions, :idempotency_key

      # @param customer_id [String]
      # @param name [String]
      # @param routing_number [String]
      # @param account_number [String]
      # @param account_type [String]
      # @param type [String]
      # @param tags [Hash] - optional
      # @param permissions [String] - optional
      # @param idempotency_key [String] - optional
      def initialize(customer_id, name, routing_number, account_number, account_type, type, tags = nil, permissions = nil, idempotency_key = nil)
        @customer_id = customer_id
        @name = name
        @routing_number = routing_number
        @account_number = account_number
        @account_type = account_type
        @type = type
        @tags = tags
        @permissions = permissions
        @idempotency_key = idempotency_key
      end

      def to_json_api
        payload = {
          "data": {
            "type": "achCounterparty",
            "attributes": {
              name: name,
              routingNumber: routing_number,
              accountNumber: account_number,
              accountType: account_type,
              type: type,
              tags: tags,
              permissions: permissions,
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
