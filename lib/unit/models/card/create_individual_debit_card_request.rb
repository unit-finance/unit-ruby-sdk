# frozen_string_literal: true

# Request to create individual debit card request
# @see https://docs.unit.co/cards#create-individual-debit-card
module Unit
  module Card
    class CreateIndividualDebitCardRequest
      attr_reader :account_id, :customer_id, :shipping_address, :design, :additional_embossed_text, :idempotency_key, :tags, :limits, :print_only_business_name

      # @param account_id [String]
      # @param customer_id [String] - optional
      # @param shipping_address [String] - optional
      # @param design [String] - optional
      # @param additional_embossed_text [String] - optional
      # @param idempotency_key [String] - optional
      # @param tags [Hash] - optional
      # @param limits [Hash] - optional
      # @param print_only_business_name [String] - optional
      def initialize(account_id, customer_id = nil, shipping_address = nil, design = nil, additional_embossed_text = nil,
                     idempotency_key = nil, tags = nil, limits = nil, print_only_business_name = nil)
        @account_id = account_id
        @customer_id = customer_id
        @shipping_address = shipping_address
        @design = design
        @additional_embossed_text = additional_embossed_text
        @idempotency_key = idempotency_key
        @tags = tags
        @limits = limits
        @print_only_business_name = print_only_business_name
      end

      def to_json_api
        payload = {
          "data": {
            "type": "individualDebitCard",
            "attributes": {
              "shippingAddress": shipping_address&.represent,
              "design": design,
              "additionalEmbossedText": additional_embossed_text,
              "idempotencyKey": idempotency_key,
              "tags": tags,
              "limits": limits,
              "printOnlyBusinessName": print_only_business_name
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
