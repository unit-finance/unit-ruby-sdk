# frozen_string_literal: true

# Request to get a check deposit image
# @see https://docs.unit.co/check-deposits#get-specific-check-deposit-front-image
# @see https://docs.unit.co/check-deposits#get-specific-check-deposit-back-image
module Unit
  module CheckDeposit
    class GetImageRequest
      attr_reader :deposit_id, :is_front_side

      # @param deposit_id [String]
      # @param is_front_side [Boolean] - optional
      def initialize(deposit_id, is_front_side: true)
        @deposit_id = deposit_id
        @is_front_side = is_front_side
      end
    end
  end
end
