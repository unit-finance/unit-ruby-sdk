# frozen_string_literal: true

# Represents an Error returned from Unit's API
module UnitError
  # @param [Hash] json_api
  # @return [UnitError]
  def self.from_json_api(response)
    errors = response["errors"]

    errors&.map do |error|
      error["title"]
      error["status"]
      error["detail"]
      error["details"]
      error["source"]
      error["code"]
    end
    UnitErrorParams.new(errors)
  end
end

class UnitErrorParams
  attr_reader :errors

  # @param errors [Array]
  def initialize(errors)
    @errors = errors
  end
end
