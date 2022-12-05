# frozen_string_literal: true

require "httparty"

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
  def response_handler(response)
    included = response["included"].nil? ? nil : response["included"]
    case response.code
    when 200...300
      UnitResponse.new(response["data"], included)
    else
      UnitError.from_json_api(response)
    end
  end
end
