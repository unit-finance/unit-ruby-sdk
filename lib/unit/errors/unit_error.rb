# frozen_string_literal: true

require_relative "unit_error_payload"
class UnitError
  def initialize(errors)
    @errors = errors
  end

  def self.from_json_api(response)
    errors = response["errors"]

    errors&.map do |error|
      UnitErrorPayload.new(error["title"], error["status"],
                           error["detail"], error["details"], error["source"], error["code"])
    end
    UnitError.new(errors)
  end
end
