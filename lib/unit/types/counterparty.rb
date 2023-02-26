# frozen_string_literal: true

module Unit
  module Types
    class Counterparty
      attr_reader :name, :account_number, :routing_number, :account_type

      # @param name [String]
      # @param account_number [String]
      # @param routing_number [String]
      # @param account_type [String]
      def initialize(name, account_number, routing_number, account_type)
        @name = name
        @account_number = account_number
        @routing_number = routing_number
        @account_type = account_type
      end

      def represent
        params = {
          name: name,
          accountNumber: account_number,
          routingNumber: routing_number,
          accountType: account_type
        }
        params.compact
      end
    end
  end
end
