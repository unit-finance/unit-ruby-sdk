# frozen_string_literal: true

# Request to freeze a credit account
# @see https://docs.unit.co/credit-accounts#freeze-account
module Unit
  module Account
    module Credit
      class FreezeAccountRequest
        attr_reader :account_id, :reason, :reason_text

        # @param account_id [String]
        # @param reason [String]
        # @param reason_text [String] - optional
        def initialize(account_id, reason, reason_text = nil)
          @account_id = account_id
          @reason = reason
          @reason_text = reason_text
        end

        def to_json_api
          payload = {
            data: {
              type: "creditAccountFreeze",
              attributes: {
                reason: reason,
                reasonText: reason_text
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
