# frozen_string_literal: true

# Request to create a wire payment by calling Unit's API
# @see https://docs.unit.co/wires#wire-payments
module Unit
  module Payment
    class CreateWirePaymentRequest
      attr_reader :account_id, :amount, :description, :counterparty, :idempotency_key, :tags

      # @param account_id [String]
      # @param amount [Integer]
      # @param description [String]
      # @param counterparty [WireCounterparty]
      # @param idempotency_key [String] - optional
      # @param tags [Hash] - optional
      def initialize(account_id, amount, description, counterparty, idempotency_key = nil, tags = nil)
        @account_id = account_id
        @amount = amount
        @description = description
        @counterparty = counterparty
        @idempotency_key = idempotency_key
        @tags = tags
      end

      def to_json_api
        payload = {
          data: {
            type: "wirePayment",
            attributes: {
              amount: amount,
              description: description,
              counterparty: counterparty.represent,
              idempotencyKey: idempotency_key,
              tags: tags
            },
            relationships: { account: Unit::Types::Relationship.new("account", account_id).to_hash }
          }
        }
        payload[:data][:attributes].compact!
        payload.to_json
      end
    end
  end
end
