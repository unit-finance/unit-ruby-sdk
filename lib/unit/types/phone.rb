# frozen_string_literal: true

require "sorbet-runtime"

class Phone
  attr_reader :country_code, :number

  extend T::Sig

  sig do
    params(country_code: String, number: String).void
  end
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

  def self.from_json_api(data)
    Phone.new(data["countryCode"], data["number"])
  end
end
