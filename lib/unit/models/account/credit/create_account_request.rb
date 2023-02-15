# frozen_string_literal: true

# Request to create a deposit account
# @see https://docs.unit.co/credit-accounts#create-credit-account
module Unit
  module Account
    module Credit
      class CreateAccountRequest
        attr_reader :credit_terms, :credit_limit, :customer_id, :tags, :idempotency_key

        # @param credit_terms [String]
        # @param credit_limit [Integer]
        # @param customer_id [String] - optional
        # @param tags [Hash] - optional
        # @param idempotency_key [String] - optional
        def initialize(credit_terms, credit_limit, customer_id = nil, tags = nil, idempotency_key = nil)
          @credit_terms = credit_terms
          @credit_limit = credit_limit
          @customer_id = customer_id
          @tags = tags
          @idempotency_key = idempotency_key
        end

        def to_json_api
          payload = {
            data: {
              type: "creditAccount",
              attributes: {
                creditTerms: credit_terms,
                creditLimit: credit_limit,
                tags: tags
              },
              relationships: {
                customer: Unit::Types::Relationship.new("customer", customer_id).to_hash
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
