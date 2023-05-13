# frozen_string_literal: true

module Unit
  module Repayment
    REPAYMENT_LIMIT = 100
    REPAYMENT_OFFSET = 0

    autoload :CreateAchRepaymentRequest, "unit/models/repayment/create_ach_repayment_request"
    autoload :CreateBookRepaymentRequest, "unit/models/repayment/create_book_repayment_request"
    autoload :ListRepaymentParams, "unit/models/repayment/list_repayment_params"

    class << self
      # Get a repayment by calling Unit's API
      # @see https://docs.unit.co/repayments#get-specific-repayment
      # @param repayment_id [String]
      def get_repayment(repayment_id:)
        Unit::Resource::RepaymentResource.get(repayment_id)
      end

      # Create a book repayment by calling Unit's API
      # @see https://docs.unit.co/repayments#book-repayment
      # @param account_id [String]
      # @param credit_account_id [String]
      # @param counterparty_account_id [String]
      # @param description [String]
      # @param amount [Integer]
      # @param transaction_summary_override [String]
      # @param tags [Array<String>] - optional
      # @param idempotency_key [String] - optional
      def create_book_repayment(account_id:, credit_account_id:, counterparty_account_id:, description:, amount:, transaction_summary_override:, tags: nil, idempotency_key: nil)
        request = Unit::Repayment::CreateBookRepaymentRequest.new(account_id, credit_account_id, counterparty_account_id, description, amount, transaction_summary_override, tags, idempotency_key)
        Unit::Resource::RepaymentResource.create(request)
      end

      # Create an ach repayment by calling Unit's API
      # @see https://docs.unit.co/repayments#create-ach-repayment
      # @param account_id [String]
      # @param credit_account_id [String]
      # @param counterparty_id [String]
      # @param description [String]
      # @param amount [Integer]
      # @param addenda [String]
      # @param tags [Hash] - optional
      # @param same_day [Boolean] - optional
      # @param idempotency_key [String] - optional
      def create_ach_repayment(account_id:, credit_account_id:, counterparty_id:, description:, amount:, addenda:, tags: nil, idempotency_key: nil, same_day: false)
        request = Unit::Repayment::CreateAchRepaymentRequest.new(account_id, credit_account_id, counterparty_id, description, amount, addenda, tags, idempotency_key, same_day: same_day)
        Unit::Resource::RepaymentResource.create(request)
      end

      # List repayments by calling Unit's API
      # @see https://docs.unit.co/repayments#list-repayments
      # @param limit [Integer] - optional
      # @param offset [Integer] - optional
      # @param account_id [String] - optional
      # @param credit_account_id [String] - optional
      # @param customer_id [String] - optional
      # @param status [Array<String>] - optional
      # @param type [Array<String>] - optional
      def list_repayments(limit: REPAYMENT_LIMIT, offset: REPAYMENT_OFFSET, account_id: nil,
                          credit_account_id: nil, customer_id: nil, status: nil, type: nil)
        request = Unit::Repayment::ListRepaymentParams.new(limit, offset, account_id, credit_account_id, customer_id, status, type)
        Unit::Resource::RepaymentResource.list(request)
      end
    end
  end
end
