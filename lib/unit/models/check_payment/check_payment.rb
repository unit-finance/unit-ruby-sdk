# frozen_string_literal: true

module Unit
  module CheckPayment
    CHECK_PAYMENT_LIMIT = 100
    CHECK_PAYMENT_OFFSET = 0

    autoload :GetRequest, "unit/models/check_payment/get_request"
    autoload :ListPaymentParams, "unit/models/check_payment/list_check_payment_params"
    autoload :GetImageRequest, "unit/models/check_payment/get_image_request"
    autoload :ReturnCheckPaymentRequest, "unit/models/check_payment/return_check_payment_request"

    class << self
      # Get a check payment by id
      # @see https://docs.unit.co/check-payments#get-specific-check-payment
      # @param payment_id [String]
      # @param include [Array<String>] - optional
      def get_payment(payment_id:, include: nil)
        request = GetRequest.new(payment_id, include)
        Unit::Resource::CheckPaymentResource.get(request)
      end

      # Request to list check payments
      # @see https://docs.unit.co/check-payments#list-check-payments
      # @param limit [Integer] - optional
      # @param offset [Integer] - optional
      # @param account_id [String] - optional
      # @param customer_id [String] - optional
      # @param tags [Hash] - optional
      # @param sort [String] - optional
      # @param since [String] - optional
      # @param _until [String] - optional
      # @param status [Array<String>] - optional
      # @param from_amount [String] - optional
      # @param to_amount [String] - optional
      # @param check_number [String] - optional
      # @param include [Array<String>] - optional
      def list_payment(limit: CHECK_PAYMENT_LIMIT, offset: CHECK_PAYMENT_OFFSET, account_id: nil,
                       customer_id: nil, tags: nil, sort: nil, since: nil, _until: nil, status: nil,
                       from_amount: nil, to_amount: nil, check_number: nil, include: nil)

        request = ListPaymentParams.new(limit, offset, account_id, customer_id, tags, sort, since, _until,
                                        status, from_amount, to_amount, check_number, include)
        Unit::Resource::CheckPaymentResource.list(request)
      end

      # Get a check deposit image front or back side
      # @see https://docs.unit.co/check-payments#get-specific-check-payment-front-image
      # @see https://docs.unit.co/check-payments#get-specific-check-payment-back-image
      # @param payment_id [String]
      # @param is_front_side [Boolean] - optional
      def get_image(payment_id:, is_front_side: true)
        request = GetImageRequest.new(payment_id, is_front_side: is_front_side)
        Unit::Resource::CheckPaymentResource.get_image(request)
      end

      # Return check payment by id
      # @see https://docs.unit.co/check-payments#return-check-payment
      # @param payment_id [String]
      # @param return_reason_code [String]
      def return_payment(payment_id:, return_reason_code:)
        request = ReturnCheckPaymentRequest.new(payment_id, return_reason_code)
        Unit::Resource::CheckPaymentResource.return_payment(request)
      end

      # Approve Check Payment Additional Verification
      # @see https://docs.unit.co/check-payments#approve-check-payment-additional-verification
      # @param payment_id [String]
      def approve_payment_verification(payment_id:)
        Unit::Resource::CheckPaymentResource.approve_payment_verification(payment_id)
      end
    end
  end
end
