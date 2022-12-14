# frozen_string_literal: true

# Request to close a deposit account
# @see https://docs.unit.co/deposit-accounts#close-account
module Unit
  module Account
    module Deposit
      class CloseDepositAccountRequest
        attr_reader :account_id, :reason

        # @param account_id [String]
        # @param reason [String]
        def initialize(account_id, reason)
          @account_id = account_id
          @reason = reason
        end

        def to_json_api
          payload = {
            data: {
              type: "accountClose",
              attributes: {
                reason: reason
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
