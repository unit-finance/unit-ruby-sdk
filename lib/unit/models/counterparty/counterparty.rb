# frozen_string_literal: true

module Unit
  module Counterparty
    COUNTER_PARTY_LIMIT = 100
    COUNTER_PARTY_OFFSET = 0

    autoload :CreateCounterpartyRequest, "unit/models/counterparty/create_counterparty_request"
    autoload :CreateWithPlaidTokenRequest, "unit/models/counterparty/create_with_plaid_token_request"
    autoload :ListCounterpartyParams, "unit/models/counterparty/list_counterparty_params"
    autoload :UpdateCounterpartyRequest, "unit/models/counterparty/update_counterparty_request"

    class << self
      # Create counterparty by calling Unit's API
      # @see https://docs.unit.co/payments-counterparties/#create-counterparty
      # @param customer_id [String]
      # @param name [String]
      # @param routing_number [String]
      # @param account_number [String]
      # @param account_type [String]
      # @param type [String]
      # @param tags [Hash] - optional
      # @param permissions [String] - optional
      # @param idempotency_key [String] - optional
      def create_counterparty(customer_id:, name:, routing_number:, account_number:, account_type:, type:, tags: nil, permissions: nil, idempotency_key: nil)
        request = CreateCounterpartyRequest.new(customer_id, name, routing_number, account_number, account_type, type, tags, permissions, idempotency_key)
        Unit::Resource::CounterpartyResource.create_counterparty(request)
      end

      # Create counterparty with plaid token
      # @see https://docs.unit.co/payments-counterparties/#create-counterparty-with-plaid-token
      # @param customer_id [String]
      # @param type [String]
      # @param name [String]
      # @param plaid_processor_token [String]
      # @param verify_name [Boolean] - optional
      # @param permissions [String] - optional
      # @param tags [Hash] - optional
      # @param idempotency_key [String] - optional
      def create_with_plaid_token(customer_id:, type:, name:, plaid_processor_token:, verify_name: nil, permissions: nil, tags: nil, idempotency_key: nil)
        request = CreateWithPlaidTokenRequest.new(customer_id, type, name, plaid_processor_token, verify_name, permissions, tags, idempotency_key)
        Unit::Resource::CounterpartyResource.create_counterparty(request)
      end

      # List counterparties
      # @see https://docs.unit.co/payments-counterparties/#list-counterparties
      # @param limit [Integer] - optional
      # @param offset [Integer] - optional
      # @param customer_id [String] - optional
      # @param account_number [String] - optional
      # @param routing_number [String] - optional
      # @param tags [Hash] - optional
      def list_counterparty(limit: COUNTER_PARTY_LIMIT, offset: COUNTER_PARTY_OFFSET, customer_id: nil, account_number: nil, routing_number: nil, tags: nil)
        params = ListCounterpartyParams.new(limit, offset, customer_id, account_number, routing_number, tags)
        Unit::Resource::CounterpartyResource.list(params)
      end

      # Get counterparty by id
      # @param counterparty_id [String]
      # @see https://docs.unit.co/payments-counterparties/#get-one-counterparty
      def get_counterparty(counterparty_id:)
        Unit::Resource::CounterpartyResource.get_counterparty(counterparty_id)
      end

      # Get counterparty balance
      # @param counterparty_id [String]
      # @see https://docs.unit.co/payments-counterparties/#get-one-counterparty
      def get_counterparty_balance(counterparty_id:)
        Unit::Resource::CounterpartyResource.get_counterparty_balance(counterparty_id)
      end

      # Update counterparty
      # @see https://docs.unit.co/payments-counterparties/#list-counterparties
      # @param counterparty_id [String]
      # @param plaid_processor_token [String]
      # @param verify_name [Boolean] - optional
      # @param permissions [String] - optional
      # @param tags [Hash] - optional
      def update_counterparty(counterparty_id:, plaid_processor_token: nil, verify_name: nil, permissions: nil, tags: nil)
        request = UpdateCounterpartyRequest.new(counterparty_id, plaid_processor_token, verify_name, permissions, tags)
        Unit::Resource::CounterpartyResource.update_counterparty(request)
      end

      # Delete counterparty
      # @param counterparty_id [String]
      # @see https://docs.unit.co/payments-counterparties/#get-one-counterparty
      def delete_counterparty(counterparty_id:)
        Unit::Resource::CounterpartyResource.delete(counterparty_id)
      end
    end
  end
end
