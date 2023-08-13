# frozen_string_literal: true

module Unit
  module StopPayment
    STOP_PAYMENT_LIMIT = 100
    STOP_PAYMENT_OFFSET = 0

    autoload :CreateStopPaymentRequest, "unit/models/stop_payment/create_stop_payment_request"
    autoload :ListStopPaymentParams, "unit/models/stop_payment/list_stop_payment_params"

    class << self
      # Create a stop payment
      # @see https://docs.unit.co/stop-payments#create-stop-payment
      # @param amount [Integer]
      # @param check_number [String]
      # @param tags [Hash] - optional
      # @param idempotency_key [String] - optional
      def create_stop_payment(account_id:, amount:, check_number:, tags: nil, idempotency_key: nil)
        request = CreateStopPaymentRequest.new(account_id, amount, check_number, tags, idempotency_key)
        Unit::Resource::StopPaymentResource.create_payment(request)
      end

      # Get a stop payment
      # @see https://docs.unit.co/stop-payments#get-specific-stop-payment
      # @param payment_id [String]
      def get_payment(payment_id:)
        Unit::Resource::StopPaymentResource.get(payment_id)
      end

      # Request to list stop payments
      # @see https://docs.unit.co/stop-payments#list-stop-payments
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
      def list_stop_payment(limit: STOP_PAYMENT_LIMIT, offset: STOP_PAYMENT_OFFSET, account_id: nil,
                            customer_id: nil, tags: nil, sort: nil, since: nil, _until: nil, status: nil,
                            from_amount: nil, to_amount: nil, check_number: nil, include: nil)
        request = ListStopPaymentParams.new(limit, offset, account_id, customer_id, tags, sort, since, _until,
                                            status, from_amount, to_amount, check_number, include)
        Unit::Resource::StopPaymentResource.list(request)
      end

      # Disable a stop payment
      # @see https://docs.unit.co/stop-payments#disable-stop-payment
      # @param payment_id [String]
      def disable_stop_payment(payment_id:)
        Unit::Resource::StopPaymentResource.disable_payment(payment_id)
      end
    end
  end
end
