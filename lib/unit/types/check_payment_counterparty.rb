# frozen_string_literal: true

# @see https://docs.unit.co/types#check-payment-counterparty
module Unit
  module Types
    class CheckPaymentCounterparty
      attr_reader :name, :address, :counterparty_moved

      # @param name [String]
      # @param address [Address]
      # @param counterparty_moved [Boolean]
      def initialize(name, address, counterparty_moved = nil)
        @name = name
        @address = address
        @counterparty_moved = counterparty_moved
      end

      def represent
        params = {
          name: name,
          address: address&.represent,
          counterpartyMoved: counterparty_moved
        }
        params.compact
      end
    end
  end
end
