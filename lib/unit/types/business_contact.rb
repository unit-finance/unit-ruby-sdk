# frozen_string_literal: true

require_relative "full_name"
require_relative "phone"


class BusinessContact
  attr_reader :full_name, :email, :phone

  # @param [FullName] full_name
  # @param [String] email
  # @param [Phone] phone
  def initialize(full_name, email, phone)
    @full_name = full_name
    @email = email
    @phone = phone
  end

  # @param [Hash] data
  # @return [BusinessContact]
  def self.from_json_api(data)
    BusinessContact.new(FullName.from_json_api(data["fullName"]), data["email"], Phone.from_json_api(data["phone"]))
  end

  # @return [Hash]
  def represent
    {
      fullName: full_name.represent,
      email: email,
      phone: phone.represent
    }
  end
end
