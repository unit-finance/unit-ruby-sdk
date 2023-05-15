# frozen_string_literal: true

# Create a recurring debit ACH payment request
# @see https://docs.unit.co/recurring-payments/#recurring-payment-debit-ach-payment
module Unit
  module RecurringPayment
    class CreateRecurringDebitAchPaymentRequest
      attr_reader :account_id, :counterparty_id, :amount, :description, :addenda, :schedule, :idempotency_key, :tags,
                  :verify_counterparty_balance, :same_day

      # @param account_id [String]
      # @param counterparty_id [String]
      # @param amount [Integer]
      # @param description [String]
      # @param schedule [CreateSchedule]
      # @param addenda [String] - optional
      # @param idempotency_key [String] - optional
      # @param tags [Hash] - optional
      # @param verify_counterparty_balance [Boolean] - optional
      # @param same_day [Boolean] - optional
      def initialize(account_id, counterparty_id, amount, description, schedule, addenda = nil, idempotency_key = nil, tags = nil,
                     verify_counterparty_balance = nil, same_day = nil)
        @account_id = account_id
        @counterparty_id = counterparty_id
        @amount = amount
        @description = description
        @addenda = addenda
        @schedule = schedule
        @idempotency_key = idempotency_key
        @tags = tags
        @verify_counterparty_balance = verify_counterparty_balance
        @same_day = same_day
      end

      def to_json_api
        payload = {
          "data": {
            "type": "recurringDebitAchPayment",
            "attributes": {
              "amount": amount,
              "description": description,
              "addenda": addenda,
              "schedule": schedule&.represent,
              "idempotencyKey": idempotency_key,
              "tags": tags,
              "verifyCounterpartyBalance": verify_counterparty_balance,
              "sameDay": same_day
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
