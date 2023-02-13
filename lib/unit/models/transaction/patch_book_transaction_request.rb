# frozen_string_literal: true

# Request to update a transaction's tags
# @see https://docs.unit.co/transactions#update-transaction-tags
module Unit
  module Transaction
    class PatchBookTransactionRequest
      attr_reader :account_id, :transaction_id, :summary, :tags

      # @param account_id [String]
      # @param transaction_id [String]
      # @param summary [String]
      # @param tags [Hash] - optional
      def initialize(account_id, transaction_id, summary, tags = nil)
        @account_id = account_id
        @transaction_id = transaction_id
        @summary = summary
        @tags = tags
      end

      def to_json_api
        payload = {
          data: {
            type: "bookTransaction",
            attributes: {
              summary: summary,
              tags: tags
            },
            relationships: {
              account: Unit::Types::Relationship.new("account", account_id).to_hash
            }
          }
        }
        p payload
        payload[:data][:attributes].compact!
        payload.to_json
      end
    end
  end
end
