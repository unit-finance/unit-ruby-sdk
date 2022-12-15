# frozen_string_literal: true

require "httparty"

module Unit
  module Resource
    class BaseResource
      class << self
        # Check the response code and return a UnitResponse or UnitError
        # @param [HTTParty::Response] response
        def response_handler(response)
          handler = response.code.between?(200, 299) ? Unit::UnitResponse : Unit::UnitError
          handler.from_json_api(response)
        end

        protected

        def api_url
          Unit.config[:api_url]
        end

        def token
          Unit.config[:token]
        end

        def headers
          {
            "Content-Type" => "application/vnd.api+json",
            "Authorization" => "Bearer #{Unit.config[:token]}",
            "User-Agent" => "unit-ruby-sdk"
          }
        end
      end
    end
  end
end
