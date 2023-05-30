# frozen_string_literal: true

# Request to create a recurring credit book payment
# @see https://docs.unit.co/recurring-payments/#recurring-credit-book-payment
module Unit
  module RecurringPayment
    class CreateRecurringCreditBookPaymentRequest
      attr_reader :account_id, :counterparty_id, :amount, :description, :schedule, :transaction_summary_override, :idempotency_key, :tags

      # @param account_id [String]
      # @param counterparty_id [String]
      # @param amount [Integer]
      # @param description [String]
      # @param schedule [CreateSchedule]
      # @param transaction_summary_override [String] - optional
      # @param idempotency_key [String] - optional
      # @param tags [Hash] - optional
      def initialize(account_id, counterparty_id, amount, description, schedule,
                     transaction_summary_override = nil, idempotency_key = nil, tags = nil)
        @account_id = account_id
        @counterparty_id = counterparty_id
        @amount = amount
        @description = description
        @transaction_summary_override = transaction_summary_override
        @schedule = schedule
        @idempotency_key = idempotency_key
        @tags = tags
      end

      def to_json_api
        payload = {
          "data": {
            "type": "recurringCreditBookPayment",
            "attributes": {
              "amount": amount,
              "description": description,
              "schedule": schedule&.represent,
              "transaction_summary_override": transaction_summary_override,
              "idempotencyKey": idempotency_key,
              "tags": tags
            },
            "relationships":
              {
                account: Unit::Types::Relationship.new("depositAccount", account_id).to_hash,
                counterpartyAccount: Unit::Types::Relationship.new("depositAccount", counterparty_id).to_hash
              }
          }
        }
        payload[:data][:attributes].compact!
        payload.to_json
      end
    end
  end
end
