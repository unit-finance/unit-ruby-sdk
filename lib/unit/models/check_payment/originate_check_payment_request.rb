# frozen_string_literal: true

# Request to originate check payments
# @see https://docs.unit.co/originate-check-payments/#check-payments
module Unit
  module CheckPayment
    class OriginateCheckPaymentRequest
      attr_reader :account_id, :customer_id, :customer_type, :amount, :counterparty, :description, :memo, :idempotency_key, :send_date, :tags

      # @param account_id [String]
      # @param customer_id [String]
      # @param customer_type [String]
      # @param amount [Integer]
      # @param counterparty [CheckPaymentCounterparty]
      # @param description [String]
      # @param idempotency_key [String]
      # @param memo [String] - optional
      # @param send_date [String] - optional
      # @param tags [Hash] - optional
      def initialize(account_id, customer_id, customer_type, amount, counterparty, description, idempotency_key, memo, send_date, tags = nil)
        @account_id = account_id
        @customer_id = customer_id
        @customer_type = customer_type
        @amount = amount
        @counterparty = counterparty
        @description = description
        @idempotency_key = idempotency_key
        @memo = memo
        @send_date = send_date
        @tags = tags
      end

      def to_json_api
        payload = {
          "data": {
            "type": "checkPayment",
            "attributes": {
              "amount": amount,
              "counterparty": counterparty.represent,
              "description": description,
              "memo": memo,
              "sendDate": send_date,
              "idempotencyKey": idempotency_key,
              "tags": tags
            },
            "relationships": {
              "account": Unit::Types::Relationship.new("depositAccount", account_id).to_hash,
              "customer": Unit::Types::Relationship.new(customer_type, customer_id).to_hash
            }
          }
        }
        payload[:data][:attributes].compact!
        payload.to_json
      end
    end
  end
end
