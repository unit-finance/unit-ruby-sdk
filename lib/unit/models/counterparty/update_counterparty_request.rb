# frozen_string_literal: true

# Request to update a counterparty
# @see https://docs.unit.co/payments-counterparties/#list-counterparties
module Unit
  module Counterparty
    class UpdateCounterpartyRequest
      attr_reader :counterparty_id, :plaid_processor_token, :verify_name, :permissions, :tags

      # @param counterparty_id [String]
      # @param plaid_processor_token [String]
      # @param verify_name [Boolean] - optional
      # @param permissions [String] - optional
      # @param tags [Hash] - optional
      def initialize(counterparty_id, plaid_processor_token, verify_name = nil, permissions = nil, tags = nil)
        @counterparty_id = counterparty_id
        @plaid_processor_token = plaid_processor_token
        @verify_name = verify_name
        @permissions = permissions
        @tags = tags
      end

      def to_json_api
        payload = {
          "data": {
            "type": "counterparty",
            attributes: {
              plaidProcessorToken: plaid_processor_token,
              verifyName: verify_name,
              permissions: permissions,
              tags: tags
            }
          }
        }
        payload[:data][:attributes].compact!
        payload.to_json
      end
    end
  end
end
