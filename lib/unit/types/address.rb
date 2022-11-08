# frozen_string_literal: true

require "sorbet-runtime"

class Address
  attr_reader :street, :street2, :city, :state, :postal_code, :country

  extend T::Sig

  sig do
    params(street: String, city: String,
           state: String, postal_code: String, country: String, street2: T.nilable(String)).void
  end
  def initialize(street, city, state, postal_code, country, street2 = nil)
    @street = street
    @street2 = street2
    @city = city
    @state = state
    @postal_code = postal_code
    @country = country
  end

  def represent
    {
      street: street,
      street2: street2,
      city: city,
      state: state,
      postalCode: postal_code,
      country: country
    }
  end

  def self.from_json_api(data)
    Address.new(data["street"], data["city"],
                data["state"], data["postalCode"], data["country"], data["street2"])
  end
end
