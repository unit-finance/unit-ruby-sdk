# frozen_string_literal: true

# Request to close a credit account
# @see https://docs.unit.co/credit-accounts/#close-account
module Unit
  module Account
    module Credit
      class CloseAccountRequest
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
              type: "creditAccountClose",
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
