# frozen_string_literal: true

# Request to create business credit card request
# @see https://guides.unit.co/business-charge-cards/
module Unit
  module Card
    class PatchBusinessCreditCardRequest < PatchBusinessCardRequest
      # @param card_id [String]
      # @param shipping_address [Address] - optional
      # @param address [Address] - optional
      # @param phone [Phone] - optional
      # @param email [String] - optional
      # @param design [String] - optional
      # @param tags [Hash] - optional
      # @param limits [Hash] - optional
      def initialize(card_id, shipping_address = nil, address = nil, phone = nil, email = nil, design = nil, tags = nil, limits = nil)
        super
        @type = "businessCreditCard"
      end
    end
  end
end
