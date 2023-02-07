# frozen_string_literal: true

# Request to create a new ach payment to linked counterparty by calling Unit's API
# @see https://docs.unit.co/ach-origination#payment-linked-counterparty
module Unit
  module Payment
    module Ach
      class CreatePaymentLinkedRequest
        attr_reader :account_id, :counterparty_id, :amount, :direction, :description,
                    :addenda, :idempotency_key, :tags, :verify_counterparty_balance,
                    :same_day, :sec_code

        # @param account_id [String]
        # @param counterparty_id [String]
        # @param amount [Integer]
        # @param direction [String]
        # @param description [String]
        # @param addenda [String] - optional
        # @param idempotency_key [String] - optional
        # @param tags [Hash] - optional
        # @param verify_counterparty_balance [Boolean] - optional
        # @param same_day [Boolean] - optional
        # @param sec_code [String] - optional
        def initialize(account_id, counterparty_id, amount, direction, description,
                       addenda = nil, idempotency_key = nil, tags = nil, verify_counterparty_balance = nil,
                       same_day = nil, sec_code = nil)
          @account_id = account_id
          @counterparty_id = counterparty_id
          @amount = amount
          @direction = direction
          @description = description
          @addenda = addenda
          @idempotency_key = idempotency_key
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
                addenda: addenda,
                idempotencyKey: idempotency_key,
                tags: tags,
                verifyCounterpartyBalance: verify_counterparty_balance,
                sameDay: same_day,
                secCode: sec_code
              },
              "relationships": {
                "account": Unit::Types::Relationship.new("account", account_id).to_hash,
                "counterparty": Unit::Types::Relationship.new("counterparty", counterparty_id).to_hash
              }
            }
          }
          payload[:data][:attributes].compact!
          payload.to_json
        end
      end
    end
  end
end
