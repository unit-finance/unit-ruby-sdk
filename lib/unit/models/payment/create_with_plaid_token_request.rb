# frozen_string_literal: true

# Request to create a new ach payment with a plaid token by calling Unit's API
# @see https://docs.unit.co/ach-origination#create-ach-payment-with-plaid-token
module Unit
  module Payment
    class CreateWithPlaidTokenRequest
      attr_reader :account_id, :amount, :direction, :description,
                  :plaid_processor_token, :addenda, :idempotency_key,
                  :counterparty_name, :tags, :verify_counterparty_balance,
                  :same_day, :sec_code

      # @param account_id [String]
      # @param amount [Integer]
      # @param direction [String]
      # @param description [String]
      # @param plaid_processor_token [String]
      # @param addenda [String] - optional
      # @param idempotency_key [String] - optional
      # @param counterparty_name [String] - optional
      # @param tags [Hash] - optional
      # @param verify_counterparty_balance [Boolean] - optional
      # @param same_day [Boolean] - optional
      # @param sec_code [String] - optional
      def initialize(account_id, amount, direction, description, plaid_processor_token,
                     addenda = nil, idempotency_key = nil, counterparty_name = nil, tags = nil,
                     verify_counterparty_balance = nil, same_day = nil, sec_code = nil)
        @account_id = account_id
        @amount = amount
        @direction = direction
        @description = description
        @plaid_processor_token = plaid_processor_token
        @addenda = addenda
        @idempotency_key = idempotency_key
        @counterparty_name = counterparty_name
        @tags = tags
        @verify_counterparty_balance = verify_counterparty_balance
        @same_day = same_day
        @sec_code = sec_code
      end

      def to_json_api
        payload = {
          "data": {
            "type": "achPayment",
            "attributes": {
              amount: amount,
              direction: direction,
              description: description,
              plaidProcessorToken: plaid_processor_token,
              addenda: addenda,
              idempotencyKey: idempotency_key,
              counterpartyName: counterparty_name,
              tags: tags,
              verifyCounterpartyBalance: verify_counterparty_balance,
              sameDay: same_day,
              secCode: sec_code
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
