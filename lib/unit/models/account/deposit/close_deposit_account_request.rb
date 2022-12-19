# frozen_string_literal: true

# Request to close a deposit account
# @see https://docs.unit.co/deposit-accounts#close-account
module Unit
  module Account
    module Deposit
      class CloseDepositAccountRequest
        attr_reader :account_id, :reason, :fraud_reason

        # @param account_id [String]
        # @param reason [String]
        # @param fraud_reason [String] - optional
        def initialize(account_id, reason, fraud_reason = nil)
          @account_id = account_id
          @reason = reason
          @fraud_reason = fraud_reason
        end

        def to_json_api
          payload = {
            data: {
              type: "accountClose",
              attributes: {
                reason: reason,
                fraudReason: fraud_reason
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
