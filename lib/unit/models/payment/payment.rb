# frozen_string_literal: true

module Unit
  module Payment
    autoload :CreateBookPaymentRequest, "unit/models/payment/create_book_payment_request"
    autoload :PatchBookPaymentRequest, "unit/models/payment/patch_book_payment_request"

    class << self
      # Create a new book payment by calling Unit's API
      # @see https://docs.unit.co/book-payments#book-payments
      # @param amount [Integer]
      # @param description [String]
      # @param transaction_summary_override [String] - optional
      # @param idempotency_key [String] - optional
      # @param tags [Hash] - optional
      # @return [UnitResponse, UnitError]
      def create_book_payment(amount:, description:, relationships:, transaction_summary_override: nil,
                              idempotency_key: nil, tags: nil)
        request = Unit::Payment::CreateBookPaymentRequest.new(amount, description, relationships, transaction_summary_override,
                                                              idempotency_key, tags)
        Unit::Resource::PaymentResource.create_payment(request)
      end

      # Update a book payment by calling Unit's API
      # @see https://docs.unit.co/book-payments#update-book-payment
      # @param payment_id [String]
      # @param tags [Hash] - optional
      # @return [UnitResponse, UnitError]
      def update_book_payment(payment_id:, tags: nil)
        request = Unit::Payment::PatchBookPaymentRequest.new(payment_id, tags)
        Unit::Resource::PaymentResource.update_payment(request)
      end
    end
  end
end
