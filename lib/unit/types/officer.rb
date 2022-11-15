# frozen_string_literal: true

require "sorbet-runtime"

class Officer
  attr_reader :full_name, :date_of_birth, :address, :phone, :email,
              :status, :title, :ssn, :passport, :nationality

  def initialize(full_name, date_of_birth, address, phone, email, ssn,
                 status = nil, title = nil, passport = nil,
                 nationality = nil)
    @full_name = full_name
    @date_of_birth = date_of_birth
    @address = address
    @phone = phone
    @email = email
    @status = status
    @title = title
    @ssn = ssn
    @passport = passport
    @nationality = nationality
  end

  def self.from_json_api(data)
    Officer.new(data["fullName"], data["dateOfBirth"], data["address"], data["phone"], data["email"], data["ssn"],
                data["status"], data["title"], data["passport"], data["nationality"])
  end

  def represent
    payload =
      {
        fullName: full_name.represent,
        dateOfBirth: date_of_birth,
        address: address.represent,
        phone: phone.represent,
        email: email,
        ssn: ssn
      }
    payload["status"] = status if status
    payload["title"] = title if title
    payload["passport"] = passport if passport
    payload["nationality"] = nationality if nationality
    payload
  end
end
