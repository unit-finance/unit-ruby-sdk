# frozen_string_literal: true

require_relative "unit/version"

module Unit
  autoload :Resource, "unit/api_resources/api_resources"
  autoload :Application, "unit/models/application/application"
  autoload :Types, "unit/types/types"
  autoload :UnitErrorPayload, "unit/errors/unit_error_payload"
  autoload :UnitError, "unit/errors/unit_error"

  # Configure Unit SDK
  # @param [Hash] new_config If passed, update config
  # @return [Hash] current config
  def self.config(new_config=nil)
    @@config ||= new_config
  end
end
