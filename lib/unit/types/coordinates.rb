# frozen_string_literal: true

module Unit
  module Types
    class Coordinates
      attr_reader :latitude, :longitude

      # @param latitude [Float] The latitude
      # @param longitude [Float] The longitude
      def initialize(latitude, longitude)
        @latitude = latitude
        @longitude = longitude
      end

      def represent
        params = {
          longitude: longitude,
          latitude: latitude
        }
        params.compact.to_json
      end
    end
  end
end
