# frozen_string_literal: true


class UnitResponse
  # @param data [Hash] The JSON API payload
  # @param included [Array] The JSON API payload

  def initialize(data, included)
    @data = data
    @included = included
  end
end
