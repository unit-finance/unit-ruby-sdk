# frozen_string_literal: true

module Unit
  module Types
    class DeviceFingerprint
      attr_reader :value, :provider

      # @param value [String] The value
      # @param provider [String] The provider
      def initialize(value, provider = "iovation")
        @value = value
        @provider = provider
      end

      def represent
        {
          value: value,
          provider: provider
        }
      end
    end
  end
end
