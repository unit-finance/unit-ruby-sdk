# frozen_string_literal: true

module Unit
  module Resource
    class BaseResource
      class << self
        # Check the response code and return a UnitResponse or UnitError
        # @param [Net::HTTPResponse] response
        def response_handler(response)
          if response.code.between?(200, 299)
            Unit::UnitResponse.new(response.body["data"], response.body["included"], response.body["meta"])
          else
            Unit::UnitError.from_json_api(response)
          end
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
