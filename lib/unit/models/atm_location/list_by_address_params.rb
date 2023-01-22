# frozen_string_literal: true

# params fot list atm locations by address
# @see
module Unit
  module AtmLocation
    class ListByAddressParams
      attr_reader :address, :search_radius

      # @param address [Address]
      # @param search_radius [Integer]
      def initialize(address, search_radius = nil)
        @address = address
        @search_radius = search_radius
      end

      def to_hash
        params = {
          "filter[address]": address.represent.to_json,
          "filter[searchRadius]": search_radius
        }
        params.compact
      end
    end
  end
end
