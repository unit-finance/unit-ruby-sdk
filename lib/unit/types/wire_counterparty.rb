# frozen_string_literal: true

# @see https://docs.unit.co/types/#wire-counterparty
module Unit
  module Types
    class WireCounterparty
      attr_reader :name, :account_number, :routing_number, :address

      # @param name [String]
      # @param account_number [String]
      # @param routing_number [String]
      # @param address [Address]
      def initialize(name, account_number, routing_number, address)
        @name = name
        @account_number = account_number
        @routing_number = routing_number
        @address = address
      end

      def represent
        params = {
          name: name,
          accountNumber: account_number,
          routingNumber: routing_number,
          address: address&.represent
        }
        params.compact
      end
    end
  end
end
