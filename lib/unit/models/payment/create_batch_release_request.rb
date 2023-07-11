# frozen_string_literal: true

# Request to create a batch release
# @see https://docs.unit.co/batch-payments/#create-batch-releases
module Unit
  module Payment
    class CreateBatchReleaseRequest
      attr_reader :account_id, :batch_account_id, :amount, :description, :sender_name, :sender_address,
                  :sender_account_number, :tags, :idempotency_key

      # @param account_id [String]
      # @param batch_account_id [String]
      # @param amount [Integer]
      # @param description [String]
      # @param sender_name [String]
      # @param sender_address [Address]
      # @param sender_account_number [String]
      # @param tags [Hash] - optional
      # @param idempotency_key [String] - optional
      def initialize(account_id, batch_account_id, amount, description, sender_name, sender_address, sender_account_number, tags = nil, idempotency_key = nil)
        @account_id = account_id
        @batch_account_id = batch_account_id
        @amount = amount
        @description = description
        @sender_name = sender_name
        @sender_address = sender_address
        @sender_account_number = sender_account_number
        @tags = tags
        @idempotency_key = idempotency_key
      end

      def to_hash
        payload = {
          "type": "batchRelease",
          "attributes": {
            "amount": amount,
            "description": description,
            "senderName": sender_name,
            "senderAddress": sender_address&.represent,
            "senderAccountNumber": sender_account_number,
            "tags": tags,
            "idempotencyKey": idempotency_key
          },
          "relationships": {
            "batchAccount": Unit::Types::Relationship.new("batchAccount", batch_account_id).to_hash,
            "receiver": Unit::Types::Relationship.new("depositAccount", account_id).to_hash
          }
        }
        payload[:attributes].compact!
        payload
      end
    end
  end
end
