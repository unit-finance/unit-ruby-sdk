# frozen_string_literal: true

# Request to create a new ach payment to inline counterparty by calling Unit's API
# @see https://docs.unit.co/ach-origination#payment-inline-counterparty
module Unit
  module Payment
    module Ach
      class CreateAchPaymentInlineRequest
        attr_reader :account_id, :amount, :direction, :counterparty, :description,
                    :addenda, :idempotency_key, :tags, :same_day, :sec_code

        # @param account_id [String]
        # @param amount [Integer]
        # @param direction [String]
        # @param counterparty [Counterparty]
        # @param description [String]
        # @param addenda [String] - optional
        # @param idempotency_key [String] - optional
        # @param tags [Hash] - optional
        # @param same_day [Boolean] - optional
        # @param sec_code [String] - optional
        def initialize(account_id, amount, direction, counterparty, description,
                       addenda = nil, idempotency_key = nil, tags = nil, same_day = nil, sec_code = nil)
          @account_id = account_id
          @amount = amount
          @direction = direction
          @counterparty = counterparty
          @description = description
          @addenda = addenda
          @idempotency_key = idempotency_key
          @tags = tags
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
                counterparty: counterparty.represent,
                description: description,
                addenda: addenda,
                idempotencyKey: idempotency_key,
                tags: tags,
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
end
