# frozen_string_literal: true

# Request to update check deposit
# @see https://docs.unit.co/check-deposits#update-check-deposit
module Unit
  module CheckDeposit
    class PatchDepositRequest
      attr_reader :deposit_id, :tags

      # @param deposit_id [String]
      # @param tags [Hash] - optional
      def initialize(deposit_id, tags)
        @deposit_id = deposit_id
        @tags = tags
      end

      def to_json_api
        payload = {
          data: {
            type: "checkDeposit",
            attributes: { tags: tags }
          }
        }
        payload[:data][:attributes].compact!
        payload.to_json
      end
    end
  end
end
