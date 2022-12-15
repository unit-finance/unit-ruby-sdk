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
    # @param [Hash] response The response returned from Unit's API
    # @return [UnitError] a new UnitError populated with values taken from the response
    def self.from_json_api(response)
      errors = response["errors"]

      if errors.is_a?(Array)
        new(errors.map { |error| UnitErrorPayload.from_json_api(error) })
      else
        new(errors)
      end
    end
  end
end
