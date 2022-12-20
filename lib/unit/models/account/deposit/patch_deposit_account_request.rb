# frozen_string_literal: true

# Request to update a deposit account
# @see https://docs.unit.co/deposit-accounts#update-accounts
module Unit
  module Account
    module Deposit
      class PatchDepositAccountRequest
        attr_reader :account_id, :tags, :deposit_product

        # @param account_id [String]
        # @param tags [Hash] - optional
        # @param deposit_product [String] - optional
        def initialize(account_id, tags = nil, deposit_product = nil)
          @account_id = account_id
          @tags = tags
          @deposit_product = deposit_product
        end

        def to_json_api
          payload = {
            data: {
              type: "depositAccount",
              attributes: {
                tags: tags,
                depositProduct: deposit_product
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
