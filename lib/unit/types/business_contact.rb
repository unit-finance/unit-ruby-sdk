# frozen_string_literal: true

require "sorbet-runtime"

require_relative "full_name"
require_relative "phone"

class BusinessContact
  extend T::Sig

  attr_reader :full_name, :email, :phone

  sig do
    params(full_name: FullName, email: String, phone: Phone).void
  end
  def initialize(full_name, email, phone)
    @full_name = full_name
    @email = email
    @phone = phone
  end

  def self.from_json_api(data)
    BusinessContact.new(FullName.from_json_api(data["fullName"]), data["email"], Phone.from_json_api(data["phone"]))
  end

  def represent
    {
      fullName: full_name.represent,
      email: email,
      phone: phone.represent
    }
  end
end
