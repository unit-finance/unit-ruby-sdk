# frozen_string_literal: true

# Request to create a deposit account
# @see https://docs.unit.co/deposit-accounts#create-deposit-account
module Unit
  module Account
    module Deposit
      class CreateDepositAccountRequest
        attr_reader :deposit_product, :tags, :idempotency_key, :relationships

        # @param deposit_product [String]
        # @param tags [Hash]- optional
        # @param idempotency_key [String] - optional
        # @param relationships [Relationship, RelationshipArray] - optional
        def initialize(deposit_product, tags = nil, relationships = nil, idempotency_key = nil)
          @deposit_product = deposit_product
          @tags = tags
          @idempotency_key = idempotency_key
          @relationships = relationships
        end

        def to_json_api
          payload = {
            data: {
              type: "depositAccount",
              attributes: {
                depositProduct: deposit_product,
                tags: tags
              },
              relationships: relationships
            }
          }
          payload[:data][:attributes].compact!
          payload.to_json
        end
      end
    end
  end
end
