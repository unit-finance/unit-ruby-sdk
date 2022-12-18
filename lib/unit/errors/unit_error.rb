# frozen_string_literal: true

require_relative "unit_error_payload"

# Represents an Error returned from Unit's API
module Unit
  class UnitError
    attr_reader :errors

    # Create a new UnitError
    # @param [Array<UnitErrorPayload>] errors
    def initialize(errors)
      @errors = errors
    end

    # Creates a new UnitError from given response.
    # @param [HTTP::Response] response The response returned from Unit's API
    # @return [UnitError] a new UnitError populated with values taken from the response
    def self.from_json_api(response)
      new((response.body["errors"] || []).map { |error| UnitErrorPayload.from_json_api(error) })
    end
  end
end
