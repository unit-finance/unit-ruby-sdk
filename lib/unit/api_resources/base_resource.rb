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
end
