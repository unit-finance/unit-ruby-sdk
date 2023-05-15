# frozen_string_literal: true

module Unit
  module RecurringPayment
    RECURRING_PAYMENT_LIMIT = 100
    RECURRING_PAYMENT_OFFSET = 0
    autoload :CreateRecurringCreditBookPaymentRequest, "unit/models/recurring_payment/create_recurring_credit_book_payment_request"
    autoload :CreateRecurringCreditAchPaymentRequest, "unit/models/recurring_payment/create_recurring_credit_ach_payment_request"
    autoload :CreateRecurringDebitAchPaymentRequest, "unit/models/recurring_payment/create_recurring_debit_ach_payment_request"
    autoload :ListRecurringPaymentParams, "unit/models/recurring_payment/list_recurring_payment_params"

    class << self
      # Create a recurring credit book payment
      # @see https://docs.unit.co/recurring-payments/#recurring-credit-book-payment
      # @param account_id [String]
      # @param counterparty_id [String]
      # @param amount [Integer]
      # @param description [String]
      # @param schedule [CreateSchedule]
      # @param transaction_summary_override [String] - optional
      # @param idempotency_key [String] - optional
      # @param tags [Hash] - optional
      def create_recurring_credit_book_payment(account_id:, counterparty_id:, amount:, description:,
                                               schedule:, transaction_summary_override: nil, idempotency_key: nil, tags: nil)
        request = Unit::RecurringPayment::CreateRecurringCreditBookPaymentRequest.new(account_id, counterparty_id, amount, description, schedule,
                                                                                      transaction_summary_override, idempotency_key, tags)
        Unit::Resource::RecurringPaymentResource.create_recurring_payment(request)
      end

      # Create a recurring credit ACH payment
      # @see https://docs.unit.co/recurring-payments/#recurring-payment-credit-ach-payment
      # @param account_id [String]
      # @param counterparty_id [String]
      # @param amount [Integer]
      # @param description [String]
      # @param schedule [CreateSchedule]
      # @param addenda [String] - optional
      # @param idempotency_key [String] - optional
      # @param tags [Hash] - optional
      def create_recurring_credit_ach_payment(account_id:, counterparty_id:, amount:, description:, schedule:, addenda: nil, idempotency_key: nil, tags: nil)
        request = Unit::RecurringPayment::CreateRecurringCreditAchPaymentRequest.new(account_id, counterparty_id, amount, description, schedule, addenda, idempotency_key, tags)
        Unit::Resource::RecurringPaymentResource.create_recurring_payment(request)
      end

      # Create a recurring debit ACH payment
      # @see https://docs.unit.co/recurring-payments/#recurring-payment-debit-ach-payment
      # @param account_id [String]
      # @param counterparty_id [String]
      # @param amount [Integer]
      # @param description [String]
      # @param schedule [CreateSchedule]
      # @param addenda [String] - optional
      # @param idempotency_key [String] - optional
      # @param tags [Hash] - optional
      # @param verify_counterparty_balance [Boolean] - optional
      # @param same_day [Boolean] - optional
      def create_recurring_debit_ach_payment(account_id:, counterparty_id:, amount:, description:, schedule:, addenda: nil, idempotency_key: nil, tags: nil,
                                             verify_counterparty_balance: nil, same_day: nil)
        request = Unit::RecurringPayment::CreateRecurringDebitAchPaymentRequest.new(account_id, counterparty_id, amount, description, schedule, addenda, idempotency_key, tags,
                                                                                    verify_counterparty_balance, same_day)
        Unit::Resource::RecurringPaymentResource.create_recurring_payment(request)
      end

      # Enable a recurring payment
      # @see https://docs.unit.co/recurring-payments/#enable-recurring-payment
      # @param recurring_payment_id [String]
      def enable_recurring_payment(recurring_payment_id:)
        Unit::Resource::RecurringPaymentResource.enable_recurring_payment(recurring_payment_id)
      end

      # Disable a recurring payment
      # @see https://docs.unit.co/recurring-payments/#disable-recurring-payment
      # @param recurring_payment_id [String]
      def disable_recurring_payment(recurring_payment_id:)
        Unit::Resource::RecurringPaymentResource.disable_recurring_payment(recurring_payment_id)
      end

      # List recurring payments
      # @see https://docs.unit.co/recurring-payments/#list-recurring-payments
      # @param limit [Integer] - optional
      # @param offset [Integer] - optional
      # @param account_id [String] - optional
      # @param customer_id [String] - optional
      # @param status [String] - optional
      # @param type [String] - optional
      # @param from_start_time [String] - optional
      # @param to_start_time [String] - optional
      # @param from_end_time [String] - optional
      # @param to_end_time [String] - optional
      # @param sort [String] - optional
      def list_recurring_payment(limit: RECURRING_PAYMENT_LIMIT, offset: RECURRING_PAYMENT_OFFSET, account_id: nil, customer_id: nil, status: nil, type: nil,
                                 from_start_time: nil, to_start_time: nil, from_end_time: nil, to_end_time: nil, sort: nil)
        request = Unit::RecurringPayment::ListRecurringPaymentParams.new(limit, offset, account_id, customer_id, status, type,
                                                                         from_start_time, to_start_time, from_end_time, to_end_time, sort)
        Unit::Resource::RecurringPaymentResource.list_recurring_payment(request)
      end

      # Get a recurring payment
      # @see https://docs.unit.co/recurring-payments/#get-specific-recurring-payment
      # @param recurring_payment_id [String]
      def get_recurring_payment(recurring_payment_id:)
        Unit::Resource::RecurringPaymentResource.get_recurring_payment(recurring_payment_id)
      end
    end
  end
end
