# frozen_string_literal: true

require_relative "./base_resource"
require_relative "../utils/http_helper"
require "json"

# class for creating request for institutions to Unit API and parsing responses
# @see https://docs.unit.co/institutions/
module Unit
  module Resource
    class InstitutionResource < Unit::Resource::BaseResource
      class << self
        # Get an institution by routing number by calling Unit's API
        # @param routing_number [String]
        # @return [UnitResponse, UnitError]
        def get_institution(routing_number)
          response = HttpHelper.get("#{api_url}/institutions/#{routing_number}", headers: headers)
          response_handler(response)
        end
      end
    end
  end
end
