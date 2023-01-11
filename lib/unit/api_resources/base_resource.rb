# frozen_string_literal: true

module Unit
  module Resource
    class BaseResource
      class << self
        # Check the response code and return a UnitResponse or UnitError
        # @param [HTTP::Response] response
        def response_handler(response)
          handler = response.code.to_i.between?(200, 299) ? Unit::UnitResponse : Unit::UnitError
          handler.from_json_api(response)
        end

        def file_response_handler(response)
          response.code.to_i.between?(200, 299) ? response.body : Unit::UnitError
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
            "X-UNIT-SDK" => "unit-ruby-sdk@v#{Unit::VERSION}"
          }
        end
      end
    end
  end
end
