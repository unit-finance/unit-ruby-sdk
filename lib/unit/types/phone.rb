# frozen_string_literal: true

class Phone
  attr_reader :country_code, :number

  # @param country_code [String] The country code
  # @param number [String] The number
  def initialize(country_code, number)
    @country_code = country_code
    @number = number
  end

  def represent
    {
      countryCode: country_code,
      number: number
    }
  end
end
