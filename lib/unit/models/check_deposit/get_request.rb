# frozen_string_literal: true

# Request to get check deposit by id
# @see https://docs.unit.co/check-deposits#get-specific-check-deposit
module Unit
  module CheckDeposit
    class GetRequest
      attr_reader :deposit_id, :include

      # @param deposit_id [String]
      # @param include [Array<String>] - optional
      def initialize(deposit_id, include = nil)
        @deposit_id = deposit_id
        @include = include
      end

      def to_hash
        { include: include&.join(",") }.compact
      end
    end
  end
end
