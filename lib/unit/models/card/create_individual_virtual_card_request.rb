# frozen_string_literal: true

# Request to create individual virtual card
# @see https://docs.unit.co/cards#create-individual-virtual-debit-card
module Unit
  module Card
    class CreateIndividualVirtualCardRequest
      attr_reader :account_id, :customer_id, :idempotency_key, :tags, :limits

      # @param account_id [String]
      # @param customer_id [String] - optional
      # @param idempotency_key [String] - optional
      # @param tags [Hash] - optional
      # @param limits [Hash] - optional
      def initialize(account_id, customer_id = nil, idempotency_key = nil, tags = nil, limits = nil)
        @account_id = account_id
        @customer_id = customer_id
        @idempotency_key = idempotency_key
        @tags = tags
        @limits = limits
      end

      def to_json_api
        payload = {
          "data": {
            "type": "individualVirtualDebitCard",
            "attributes": {
              "idempotencyKey": idempotency_key,
              "tags": tags,
              "limits": limits
            },
            "relationships": {
              "account": Unit::Types::Relationship.new("depositAccount", account_id).to_hash
            }
          }
        }
        customer = { "customer": Unit::Types::Relationship.new("customer", customer_id).to_hash } unless customer_id.nil?
        payload[:data][:relationships].merge!(customer) unless customer.nil?
        payload[:data][:attributes].compact!
        payload.to_json
      end
    end
  end
end
