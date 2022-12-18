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

    # Creates a new UnitResponse from given response.
    # @param [HTTP::Response] response The response returned from Unit's API
    # @return [UnitResponse] a new UnitResponse populated with values taken from the response
    def self.from_json_api(response)
      new(response.body["data"], response.body["included"], response.body["meta"])
    end
  end
end
