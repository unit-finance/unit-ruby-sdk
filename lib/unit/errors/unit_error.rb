# frozen_string_literal: true

require_relative "unit_error_payload"

# Represents an Error returned from Unit's API
module Unit
  class UnitError
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

      errors&.map do |error|
        UnitErrorPayload.new(error["title"], error["status"],
                             error["detail"], error["details"], error["source"], error["code"])
      end
      UnitError.new(errors)
    end
  end
end
