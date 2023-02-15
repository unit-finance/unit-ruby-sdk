# frozen_string_literal: true

# Request to update a credit account
# @see https://docs.unit.co/credit-accounts#update-accounts
module Unit
  module Account
    module Credit
      class PatchAccountRequest
        attr_reader :account_id, :tags, :credit_limit

        # @param account_id [String]
        # @param tags [Hash] - optional
        # @param credit_limit [Integer] - optional
        def initialize(account_id, tags = nil, credit_limit = nil)
          @account_id = account_id
          @tags = tags
          @credit_limit = credit_limit
        end

        def to_json_api
          payload = {
            data: {
              type: "creditAccount",
              attributes: {
                tags: tags,
                creditLimit: credit_limit
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
