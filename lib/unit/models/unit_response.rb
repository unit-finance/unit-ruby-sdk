# frozen_string_literal: true

# Represents a response from Unit's API
module Unit
  class UnitResponse
    attr_reader :data, :included

    # @param data [Hash] The JSON API payload
    # @param included [Array] The JSON API payload

    def initialize(data, included, meta)
      @data = data
      @included = included
      @meta = meta
    end
  end
end
