# frozen_string_literal: true

module Unit
  module Types
    class Address
      attr_reader :street, :street2, :city, :state, :postal_code, :country

      # @param street [String]
      # @param city [String]
      # @param state [String]
      # @param postal_code [String]
      # @param country [String]
      # @param optional street2 [String]
      def initialize(street, city, state, postal_code, country, street2 = nil)
        @street = street
        @street2 = street2
        @city = city
        @state = state
        @postal_code = postal_code
        @country = country
      end

      def represent
        {
          street: street,
          street2: street2,
          city: city,
          state: state,
          postalCode: postal_code,
          country: country
        }
      end
    end
  end
end
