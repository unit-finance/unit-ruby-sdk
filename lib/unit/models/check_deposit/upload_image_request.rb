# frozen_string_literal: true

# Request to upload a check deposit image
# @see https://docs.unit.co/check-deposits#upload-front-side-image
# @see https://docs.unit.co/check-deposits#upload-back-side-image

module Unit
  module CheckDeposit
    class UploadImageRequest
      attr_reader :deposit_id, :file_content, :is_front_side

      # @param deposit_id [String]
      # @param file_content [String]
      # @param is_front_side [Boolean] - optional
      def initialize(deposit_id, file_content, is_front_side: true)
        @deposit_id = deposit_id
        @file_content = file_content
        @is_front_side = is_front_side
      end
    end
  end
end
