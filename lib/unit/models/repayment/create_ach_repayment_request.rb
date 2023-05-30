# frozen_string_literal: true

# Request to create an ach repayment
# @see https://docs.unit.co/repayments/#create-ach-repayment
module Unit
  module Repayment
    class CreateAchRepaymentRequest
      attr_reader :account_id, :credit_account_id, :counterparty_id, :description,
                  :amount, :addenda, :tags, :same_day, :idempotency_key

      # @param account_id [String]
      # @param credit_account_id [String]
      # @param counterparty_id [String]
      # @param description [String]
      # @param amount [Integer]
      # @param addenda [String] - optional
      # @param tags [Hash] - optional
      # @param same_day [Boolean] - optional
      # @param idempotency_key [String] - optional
      def initialize(account_id, credit_account_id, counterparty_id, description, amount, addenda = nil, tags = nil,
                     idempotency_key = nil, same_day: false)
        @account_id = account_id
        @credit_account_id = credit_account_id
        @counterparty_id = counterparty_id
        @description = description
        @amount = amount
        @addenda = addenda
        @tags = tags
        @same_day = same_day
        @idempotency_key = idempotency_key
      end

      def to_json_api
        payload = {
          data: {
            type: "achRepayment",
            attributes: {
              description: description,
              amount: amount,
              addenda: addenda,
              tags: tags,
              sameDay: same_day,
              idempotencyKey: idempotency_key
            },
            "relationships": {
              "account": Unit::Types::Relationship.new("depositAccount", account_id).to_hash,
              "creditAccount": Unit::Types::Relationship.new("creditAccount", credit_account_id).to_hash,
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
