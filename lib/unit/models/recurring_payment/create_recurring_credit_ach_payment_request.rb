# frozen_string_literal: true

# Request to create a recurring credit ach payment
# @see https://docs.unit.co/recurring-payments/#recurring-payment-credit-ach-payment
module Unit
  module RecurringPayment
    class CreateRecurringCreditAchPaymentRequest
      attr_reader :account_id, :counterparty_id, :amount, :description, :addenda, :schedule, :idempotency_key, :tags

      # @param account_id [String]
      # @param counterparty_id [String]
      # @param amount [Integer]
      # @param description [String]
      # @param schedule [CreateSchedule]
      # @param addenda [String] - optional
      # @param idempotency_key [String] - optional
      # @param tags [Hash] - optional
      def initialize(account_id, counterparty_id, amount, description, schedule, addenda = nil, idempotency_key = nil, tags = nil)
        @account_id = account_id
        @counterparty_id = counterparty_id
        @amount = amount
        @description = description
        @addenda = addenda
        @schedule = schedule
        @idempotency_key = idempotency_key
        @tags = tags
      end

      def to_json_api
        payload = {
          "data": {
            "type": "recurringCreditAchPayment",
            "attributes": {
              "amount": amount,
              "description": description,
              "addenda": addenda,
              "schedule": schedule&.represent,
              "idempotencyKey": idempotency_key,
              "tags": tags
            },
            "relationships": {
              account: Unit::Types::Relationship.new("depositAccount", account_id).to_hash,
              counterparty: Unit::Types::Relationship.new("counterparty", counterparty_id).to_hash
            }
          }
        }
        payload[:data][:attributes].compact!
        payload.to_json
      end
    end
  end
end
