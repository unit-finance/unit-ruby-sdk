# frozen_string_literal: true

# params to list atm locations by postal code
# @see https://docs.unit.co/cards-atm-locations/#list-atm-locations-by-postal-code
module Unit
  module AtmLocation
    class ListByPostalCodeParams
      attr_reader :postal_code, :search_radius

      # @param postal_code [String]
      # @param search_radius [Integer]
      def initialize(postal_code, search_radius = nil)
        @postal_code = postal_code
        @search_radius = search_radius
      end

      def to_hash
        params = {
          "filter[postalCode]": postal_code,
          "filter[searchRadius]": search_radius
        }
        params.compact
      end
    end
  end
end
