# frozen_string_literal: true

# Create a reward request
# @see https://docs.unit.co/rewards/#create-reward
module Unit
  module Reward
    class CreateRewardRequest
      attr_reader :receiving_account_id, :funding_account_id, :rewarded_transaction_id, :amount, :description, :tags, :idempotency_key

      # @param receiving_account_id [String]
      # @param amount [Integer]
      # @param description [String]
      # @param tags [Hash]
      # @param idempotency_key [String]
      # @param funding_account_id [String] - optional
      # @param rewarded_transaction_id [String] - optional
      def initialize(receiving_account_id, amount, description, tags = nil, idempotency_key = nil, funding_account_id = nil, rewarded_transaction_id = nil)
        @receiving_account_id = receiving_account_id
        @amount = amount
        @description = description
        @tags = tags
        @idempotency_key = idempotency_key
        @funding_account_id = funding_account_id
        @rewarded_transaction = rewarded_transaction_id
      end

      def to_json_api
        payload = {
          data: {
            type: "reward",
            attributes: {
              amount: amount,
              description: description,
              tags: tags,
              idempotencyKey: idempotency_key
            },
            relationships: {
              receivingAccount: Unit::Types::Relationship.new("depositAccount", receiving_account_id).to_hash
            }
          }
        }
        payload[:data][:relationships][:funding_account] = Unit::Types::Relationship.new("fundingAccount", funding_account_id).to_hash if funding_account_id
        payload[:data][:relationships][:rewardedTransaction] = Unit::Types::Relationship.new("rewardedTransaction", rewarded_transaction).to_hash if rewarded_transaction_id
        payload[:data][:attributes].compact!
        payload.to_json
      end
    end
  end
end
