# frozen_string_literal: true

# Request to create business virtual credit card request
# @see https://guides.unit.co/business-charge-cards/
module Unit
  module Card
    # @param account_id [String]
    # @param full_name [FullName]
    # @param date_of_birth [Date]
    # @param address [Address]
    # @param phone [Phone] - optional
    # @param email [String] - optional
    # @param idempotency_key [String] - optional
    # @param tags [Hash] - optional
    # @param limits [Hash] - optional
    class CreateBusinessVirtualCreditCardRequest < CreateBusinessVirtualDebitCardRequest
      def initialize(account_id, full_name, date_of_birth, address, phone, email,
                     idempotency_key, tags, limits)
        super
        @type = "businessVirtualCreditCard"
      end
    end
  end
end
