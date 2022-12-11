# frozen_string_literal: true

require "httparty"

module Unit
  module Resource
    class BaseResource
      attr_reader :api_url, :headers, :token

      # @param api_url [String] The API URL
      # @param token [String] The API token
      # @return [BaseResource]
      def initialize(api_url, token)
        @api_url = api_url
        @token = token
        @headers =
          {
            "Content-Type" => "application/vnd.api+json",
            "Authorization" => "Bearer #{token}",
            "User-Agent" => "unit-ruby-sdk"
          }
      end

      # Check the response code and return a UnitResponse or UnitError
      # @param [HTTParty::Response] response
      def self.response_handler(response)
        included = response["included"].nil? ? nil : response["included"]
        meta = response["meta"].nil? ? nil : response["meta"]
        case response.code
        when 200...300
          Unit::UnitResponse.new(response["data"], included, meta)
        else
          Unit::UnitError.from_json_api(response)
        end
      end
    end
  end
end
