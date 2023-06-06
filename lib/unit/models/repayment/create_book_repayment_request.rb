# frozen_string_literal: true

# Request to create a book repayment
# @see https://docs.unit.co/repayments/#book-repayment
module Unit
  module Repayment
    class CreateBookRepaymentRequest
      attr_reader :account_id, :credit_account_id, :counterparty_account_id, :description, :amount, :transaction_summary_override,
                  :tags, :idempotency_key

      # @param account_id [String]
      # @param credit_account_id [String]
      # @param counterparty_account_id [String]
      # @param description [String]
      # @param amount [Integer]
      # @param transaction_summary_override [String]
      # @param tags [Hash] - optional
      # @param idempotency_key [String] - optional
      def initialize(account_id, credit_account_id, counterparty_account_id, description, amount, transaction_summary_override, tags = nil, idempotency_key = nil)
        @account_id = account_id
        @credit_account_id = credit_account_id
        @counterparty_account_id = counterparty_account_id
        @description = description
        @amount = amount
        @transaction_summary_override = transaction_summary_override
        @tags = tags
        @idempotency_key = idempotency_key
      end

      def to_json_api
        payload = {
          data: {
            type: "bookRepayment",
            attributes: {
              description: description,
              amount: amount,
              transactionSummaryOverride: transaction_summary_override,
              tags: tags,
              idempotencyKey: idempotency_key
            },
            "relationships": {
              "account": Unit::Types::Relationship.new("depositAccount", account_id).to_hash,
              "creditAccount": Unit::Types::Relationship.new("creditAccount", credit_account_id).to_hash,
              "counterpartyAccount": Unit::Types::Relationship.new("account", counterparty_account_id).to_hash
            }
          }
        }
        payload[:data][:attributes].compact!
        payload.to_json
      end
    end
  end
end
