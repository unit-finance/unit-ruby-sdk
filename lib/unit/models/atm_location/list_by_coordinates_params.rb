# frozen_string_literal: true

# params to list atm locations by coordinates
# @see https://docs.unit.co/cards-atm-locations/#list-atm-locations-by-coordinates
module Unit
  module AtmLocation
    class ListByCoordinatesParams
      attr_reader :coordinates, :search_radius

      # @param coordinates [Coordinates]
      # @param search_radius [Integer]
      def initialize(coordinates, search_radius = nil)
        @coordinates = coordinates
        @search_radius = search_radius
      end

      def to_hash
        params = {
          "filter[coordinates]": coordinates.represent,
          "filter[searchRadius]": search_radius
        }
        params.compact
      end
    end
  end
end
