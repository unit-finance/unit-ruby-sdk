# frozen_string_literal: true

module Unit
  module ReceivedPayment
    RECEIVED_PAYMENT_LIMIT = 100
    RECEIVED_PAYMENT_OFFSET = 0

    autoload :PatchPaymentRequest, "unit/models/received_payment/patch_payment_request"
    autoload :ListPaymentParams, "unit/models/received_payment/list_payment_params"

    class << self
      # Get received ach payment by calling Unit's API
      # @see https://docs.unit.co/received-ach#get-specific-received-payment
      # @param payment_id [String]
      def get_payment(payment_id:)
        Unit::Resource::ReceivedPaymentResource.get_payment(payment_id)
      end

      # Update a received ACH payment by calling Unit's API
      # @see https://docs.unit.co/received-ach#update-received-payment
      # @param payment_id [String]
      # @param tags [Hash] - optional
      def update_payment(payment_id:, tags: nil)
        request = Unit::ReceivedPayment::PatchPaymentRequest.new(payment_id, tags)
        Unit::Resource::ReceivedPaymentResource.update_payment(request)
      end

      # List ach payments by calling Unit's API
      # @see https://docs.unit.co/received-ach#list-received-payments
      # @param limit [Integer] - optional
      # @param offset [Integer] - optional
      # @param account_id [String] - optional
      # @param customer_id [String] - optional
      # @param status [Array<String>] - optional
      # @param include_completed [Boolean] - optional
      # @param tags [Hash] - optional
      # @param sort [String] - optional
      # @param include [Array<String>] - optional
      def list_payments(limit: RECEIVED_PAYMENT_LIMIT, offset: RECEIVED_PAYMENT_OFFSET, account_id: nil, customer_id: nil, status: nil,
                        include_completed: nil, tags: nil, sort: nil, include: nil)
        request = Unit::ReceivedPayment::ListPaymentParams.new(limit, offset, account_id, customer_id, status,
                                                               include_completed, tags, sort, include)
        Unit::Resource::ReceivedPaymentResource.list_payments(request)
      end

      # Advance a received payment by calling Unit's API
      # @see https://docs.unit.co/received-ach#advance-received-payment
      # @param payment_id [String]
      def advance_payment(payment_id:)
        Unit::Resource::ReceivedPaymentResource.advance_payment(payment_id)
      end
    end
  end
end
