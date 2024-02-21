# frozen_string_literal: true

# Request to generate a barcode for cash deposit
# @see https://unit.co/docs/api/payments/cash-deposits/#post-cash-deposit-generate-barcode
module Unit
  module CashDeposit
    class GenerateBarcodeRequest
      attr_reader :store_id, :account_id, :customer_id

      # @param store_id [String]
      # @param account_id [String]
      # @param customer_id [String]
      def initialize(store_id, account_id, customer_id)
        @store_id = store_id
        @account_id = account_id
        @customer_id = customer_id
      end

      def to_json_api
        payload = {
          "data": {
            "type": "cashDepositBarcode",
            "attributes": {
              storeId: store_id
            },
            "relationships": {
              "account": Unit::Types::Relationship.new("account", account_id).to_hash,
              "customer": Unit::Types::Relationship.new("customer", customer_id).to_hash
            }
          }
        }
        payload[:data][:attributes].compact!
        payload.to_json
      end
    end
  end
end
