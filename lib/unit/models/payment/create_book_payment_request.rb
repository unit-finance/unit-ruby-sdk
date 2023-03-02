# frozen_string_literal: true

# Request to create a book payment
# @see https://docs.unit.co/book-payments#book-payments
module Unit
  module Payment
    class CreateBookPaymentRequest
      attr_reader :amount, :description, :account_id, :counterparty_account_id, :transaction_summary_override, :idempotency_key, :tags

      # @param amount [Integer]
      # @param description [String]
      # @param account_id [String]
      # @param counterparty_account_id [String]
      # @param transaction_summary_override [String] - optional
      # @param idempotency_key [String] - optional
      # @param tags [Hash] - optional
      def initialize(amount:, description:, account_id:, counterparty_account_id:, transaction_summary_override: nil,
                     idempotency_key: nil, tags: nil)
        @amount = amount
        @description = description
        @account_id = account_id
        @counterparty_account_id = counterparty_account_id
        @transaction_summary_override = transaction_summary_override
        @idempotency_key = idempotency_key
        @tags = tags
      end

      def to_json_api
        payload = {
          data: to_hash
        }
        payload[:data][:attributes].compact!
        payload.to_json
      end

      def to_hash
        {
          type: "bookPayment",
          attributes: {
            amount: amount,
            description: description,
            transactionSummaryOverride: transaction_summary_override,
            idempotencyKey: idempotency_key,
            tags: tags
          },
          relationships: { account: Unit::Types::Relationship.new("depositAccount", account_id).to_hash,
                           counterpartyAccount: Unit::Types::Relationship.new("depositAccount", counterparty_account_id).to_hash }
        }
      end

      def change_attributes
        payload = to_hash
        payload[:attributes].compact!
        payload
      end
    end
  end
end
