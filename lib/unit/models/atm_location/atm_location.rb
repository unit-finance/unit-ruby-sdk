# frozen_string_literal: true

module Unit
  module AtmLocation
    autoload :ListByCoordinatesParams, "unit/models/atm_location/list_by_coordinates_params"
    autoload :ListByAddressParams, "unit/models/atm_location/list_by_address_params"
    autoload :ListByPostalCodeParams, "unit/models/atm_location/list_by_postal_code_params"

    class << self
      # Get a list of ATM locations by coordinates by calling Unit's API
      # @see https://docs.unit.co/cards-atm-locations#list-atm-locations-by-coordinates
      # @param coordinates [Coordinates]
      # @param search_radius [Integer] - optional
      def list_by_coordinates(coordinates:, search_radius: nil)
        params = ListByCoordinatesParams.new(coordinates, search_radius)
        Unit::Resource::AtmLocationResource.list(params)
      end

      # Get a list of ATM locations by postal code by calling Unit's API
      # @see https://docs.unit.co/cards-atm-locations#list-atm-locations-by-postal-code
      # @param postal_code [String]
      # @param search_radius [Integer] - optional
      def list_by_postal_code(postal_code:, search_radius: nil)
        params = ListByPostalCodeParams.new(postal_code, search_radius)
        Unit::Resource::AtmLocationResource.list(params)
      end

      # Get a list of ATM locations by address by calling Unit's API
      # @see https://docs.unit.co/cards-atm-locations#list-atm-locations-by-address
      # @param address [Address]
      # @param search_radius [Integer] - optional
      def list_by_address(address:, search_radius: nil)
        params = ListByAddressParams.new(address, search_radius)
        Unit::Resource::AtmLocationResource.list(params)
      end
    end
  end
end
