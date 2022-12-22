# frozen_string_literal: true

# Request to update a transaction's tags
# @see https://docs.unit.co/transactions#update-transaction-tags
module Unit
  module Transaction
    class PatchTagsRequest
      attr_accessor :account_id, :transaction_id, :tags

      # @param account_id [String]
      # @param transaction_id [String]
      # @param tags [Hash] - optional
      def initialize(account_id, transaction_id, tags = nil)
        @account_id = account_id
        @transaction_id = transaction_id
        @tags = tags
      end

      def to_json_api
        payload = {
          "data": {
            "type": "transaction",
            "attributes": {
              "tags": tags
            }
          }
        }
        payload[:data][:attributes].compact!
        payload.to_json
      end
    end
  end
end
