# frozen_string_literal: true

# Request to create business credit card request
# @see https://guides.unit.co/business-charge-cards/
module Unit
  module Card
    class CreateBusinessCreditCardRequest < CreateBusinessDebitCardRequest
      # @param account_id [String]
      # @param full_name [FullName]
      # @param date_of_birth [Date]
      # @param address [Address]
      # @param shipping_address [Address] - optional
      # @param phone [Phone] - optional
      # @param email [String] - optional
      # @param design [String] - optional
      # @param additional_embossed_text [String] - optional
      # @param idempotency_key [String] - optional
      # @param tags [Hash] - optional
      # @param limits [Hash] - optional
      # @param print_only_business_name [Boolean] - optional
      def initialize(account_id, full_name, date_of_birth, address, shipping_address = nil, phone = nil, email = nil, design = nil,
                     additional_embossed_text = nil, idempotency_key = nil, tags = nil, limits = nil, print_only_business_name = nil)
        super
        @type = "businessCreditCard"
      end
    end
  end
end
