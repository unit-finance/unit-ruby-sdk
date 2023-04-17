# frozen_string_literal: true

module Unit
  module Fee
    autoload :CreateFeeRequest, "unit/models/fee/create_fee_request"
    autoload :ReverseFeeRequest, "unit/models/fee/reverse_fee_request"

    class << self
      # Request to create fee
      # @see https://docs.unit.co/fees/#create-fee
      # @param account_id [String]
      # @param amount [Integer]
      # @param description [String]
      # @param tags [Hash] - optional
      # @param idempotency_key [String] - optional
      def create_fee(account_id:, amount:, description:, tags:, idempotency_key:)
        request = CreateFeeRequest.new(account_id, amount, description, tags, idempotency_key)
        Unit::Resource::FeeResource.create_fee(request)
      end

      # Request to reverse a fee
      # @see https://docs.unit.co/fees/#reverse-fee
      # @param account_id [String]
      # @param transaction_id [Integer]
      # @param description [String]
      # @param tags [Hash] - optional
      # @param idempotency_key [String] - optional
      def reverse_fee(account_id:, transaction_id:, description:, tags:, idempotency_key:)
        request = ReverseFeeRequest.new(account_id, transaction_id, description, tags, idempotency_key)
        Unit::Resource::FeeResource.reverse_fee(request)
      end
    end
  end
end
