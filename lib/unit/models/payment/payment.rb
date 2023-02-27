# frozen_string_literal: true

module Unit
  module Payment
    PAYMENT_LIMIT = 100
    PAYMENT_OFFSET = 0
    autoload :CreateBookPaymentRequest, "unit/models/payment/create_book_payment_request"
    autoload :PatchBookPaymentRequest, "unit/models/payment/patch_book_payment_request"
    autoload :CreateAchPaymentInlineRequest, "unit/models/payment/create_ach_payment_inline_request"
    autoload :CreatePaymentLinkedRequest, "unit/models/payment/create_payment_linked_request"
    autoload :CreateWithPlaidTokenRequest, "unit/models/payment/create_with_plaid_token_request"
    autoload :PatchReceivedPaymentRequest, "unit/models/payment/patch_received_payment_request"
    autoload :CreateWirePaymentRequest, "unit/models/payment/create_wire_payment_request"
    autoload :ListPaymentParams, "unit/models/payment/list_payment_params"
    autoload :GetRequest, "unit/models/payment/get_request"
    class << self
      # Create a new book payment by calling Unit's API
      # @see https://docs.unit.co/book-payments#book-payments
      # @param amount [Integer]
      # @param description [String]
      # @param account_id [String]
      # @param counterparty_account_id [String]
      # @param transaction_summary_override [String] - optional
      # @param idempotency_key [String] - optional
      # @param tags [Hash] - optional
      # @return [UnitResponse, UnitError]
      def create_book_payment(amount:, description:, account_id:, counterparty_account_id:, transaction_summary_override: nil,
                              idempotency_key: nil, tags: nil)
        request = Unit::Payment::CreateBookPaymentRequest.new(amount, description, account_id, counterparty_account_id, transaction_summary_override,
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

      # Create a new ach payment to inline counterparty by calling Unit's API
      # @see https://docs.unit.co/ach-origination#payment-inline-counterparty
      # @param account_id [String]
      # @param amount [Integer]
      # @param direction [String]
      # @param counterparty [Counterparty]
      # @param description [String]
      # @param addenda [String] - optional
      # @param idempotency_key [String] - optional
      # @param tags [Hash] - optional
      # @param same_day [Boolean] - optional
      # @param sec_code [String] - optional
      def create_ach_payment_inline(account_id:, amount:, direction:, counterparty:,
                                    description:, addenda: nil, idempotency_key: nil, tags: nil,
                                    same_day: nil, sec_code: nil)
        request = Unit::Payment::CreateAchPaymentInlineRequest.new(account_id, amount, direction, counterparty, description,
                                                                   addenda, idempotency_key, tags, same_day, sec_code)
        Unit::Resource::PaymentResource.create_payment(request)
      end

      # Create a new ach payment to linked counterparty by calling Unit's API
      # @see https://docs.unit.co/ach-origination#payment-linked-counterparty
      # @param account_id [String]
      # @param counterparty_id [String]
      # @param amount [Integer]
      # @param direction [String]
      # @param description [String]
      # @param addenda [String] - optional
      # @param idempotency_key [String] - optional
      # @param tags [Hash] - optional
      # @param verify_counterparty_balance [Boolean] - optional
      # @param same_day [Boolean] - optional
      # @param sec_code [String] - optional
      def create_ach_payment_linked(account_id:, counterparty_id:, amount:, direction:,
                                    description:, addenda: nil, idempotency_key: nil, tags: nil,
                                    verify_counterparty_balance: nil, same_day: nil, sec_code: nil)
        request = Unit::Payment::CreatePaymentLinkedRequest.new(account_id, counterparty_id, amount, direction,
                                                                description, addenda, idempotency_key, tags,
                                                                verify_counterparty_balance, same_day, sec_code)
        Unit::Resource::PaymentResource.create_payment(request)
      end

      # Create a new ach payment with a plaid token by calling Unit's API
      # @see https://docs.unit.co/ach-origination#create-ach-payment-with-plaid-token
      # @param account_id [String]
      # @param amount [Integer]
      # @param direction [String]
      # @param description [String]
      # @param plaid_processor_token [String]
      # @param addenda [String] - optional
      # @param idempotency_key [String] - optional
      # @param counterparty_name [String] - optional
      # @param tags [Hash] - optional
      # @param verify_counterparty_balance [Boolean] - optional
      # @param same_day [Boolean] - optional
      # @param sec_code [String] - optional
      def create_ach_payment_with_plaid_token(account_id:, amount:, direction:, description:, plaid_processor_token:,
                                              addenda: nil, idempotency_key: nil, counterparty_name: nil, tags: nil,
                                              verify_counterparty_balance: nil, same_day: nil, sec_code: nil)
        request = Unit::Payment::CreateWithPlaidTokenRequest.new(account_id, amount, direction, description, plaid_processor_token,
                                                                 addenda, idempotency_key, counterparty_name, tags,
                                                                 verify_counterparty_balance, same_day, sec_code)
        Unit::Resource::PaymentResource.create_payment(request)
      end

      # Update an ACH payment by calling Unit's API
      # @see https://docs.unit.co/ach-origination#update-ach-payment
      # @param payment_id [String]
      # @param tags [Hash] - optional
      def update_ach_payment(payment_id:, tags: nil)
        request = Unit::Payment::PatchAchPaymentRequest.new(payment_id, tags)
        Unit::Resource::PaymentResource.update_payment(request)
      end

      # Cancel a payment by calling Unit's API
      # @see https://docs.unit.co/ach-origination#cancel-ach-payment
      # @param payment_id [String]
      def cancel_payment(payment_id:)
        Unit::Resource::PaymentResource.cancel_payment(payment_id)
      end

      # Create a wire payment by calling Unit's API
      # @see https://docs.unit.co/wires#wire-payments
      # @param account_id [String]
      # @param amount [Integer]
      # @param description [String]
      # @param counterparty [WireCounterparty]
      # @param idempotency_key [String] - optional
      # @param tags [Hash] - optional
      def create_wire_payment(account_id:, amount:, description:, counterparty:, idempotency_key: nil, tags: nil)
        request = Unit::Payment::CreateWirePaymentRequest.new(account_id, amount, description, counterparty, idempotency_key, tags)
        Unit::Resource::PaymentResource.create_payment(request)
      end

      # List payments by calling Unit's API
      # @see https://docs.unit.co/payments#list-payments
      # @param limit [Integer] - optional
      # @param offset [Integer] - optional
      # @param account_id [String] - optional
      # @param customer_id [String] - optional
      # @param counterparty_account_id [String] - optional
      # @param tags [Hash] - optional
      # @param status [Array<String>] - optional
      # @param type [Array<String>] - optional
      # @param direction [Array<String>] - optional
      # @param since [String] - optional
      # @param _until [String] - optional
      # @param from_amount [Integer] - optional
      # @param to_amount [Integer] - optional
      # @param recurring_payment_id [String] - optional
      # @param feature [Array<String>] - optional
      # @param sort [String] - optional
      # @param include [Array<String>] - optional
      def list_payments(limit: PAYMENT_LIMIT, offset: PAYMENT_OFFSET, account_id: nil, customer_id: nil,
                        counterparty_account_id: nil, tags: nil, status: nil,
                        type: nil, direction: nil, since: nil, until_: nil,
                        from_amount: nil, to_amount: nil, recurring_payment_id: nil,
                        feature: nil, sort: nil, include: nil)
        request = Unit::Payment::ListPaymentParams.new(limit, offset, account_id, customer_id,
                                                       counterparty_account_id, tags, status, type, direction, since, until_,
                                                       from_amount, to_amount, recurring_payment_id, feature, sort, include)
        Unit::Resource::PaymentResource.list_payments(request)
      end

      # Get a payment by calling Unit's API
      # @see https://docs.unit.co/payments#get-specific-payment
      # @param payment_id [String]
      # @param include [Array<String>] - optional
      def get_payment(payment_id:, include: nil)
        request = Unit::Payment::GetRequest.new(payment_id, include)
        Unit::Resource::PaymentResource.get_payment(request)
      end
    end
  end
end
