# frozen_string_literal: true

# Request to update a business virtual credit card
# @see https://guides.unit.co/business-charge-cards/
module Unit
  module Card
    class PatchBusinessVirtualCreditCardRequest < PatchBusinessVirtualCardRequest
      # @param card_id [String]
      # @param address [Address] - optional
      # @param phone [Phone] - optional
      # @param email [String] - optional
      # @param tags [Hash] - optional
      # @param limits [Hash] - optional
      def initialize(card_id, address = nil, phone = nil, email = nil, tags = nil, limits = nil)
        super
        @type = "businessVirtualCreditCard"
      end
    end
  end
end
