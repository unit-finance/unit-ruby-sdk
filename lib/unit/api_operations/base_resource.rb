# frozen_string_literal: true

require "sorbet-runtime"
require "httparty"

class BaseResource
  include HTTParty
  extend T::Sig

  attr_reader :api_url, :headers

  @api_url = base_uri "https://api.s.unit.sh"

  sig do
    params(api_url: String, token: String).void
  end
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
