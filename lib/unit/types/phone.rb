# frozen_string_literal: true

class Phone
  attr_reader :country_code, :number

  # @param country_code [String] The country code
  # @param number [String] The number
  def initialize(country_code, number)
    @country_code = country_code
    @number = number
  end

  # @return [Hash]
  def represent
    {
      countryCode: country_code,
      number: number
    }
  end

  # @param data [Hash] The JSON API payload
  def self.from_json_api(data)
    Phone.new(data["countryCode"], data["number"])
  end
end
