# frozen_string_literal: true

class BeneficialOwner
  attr_reader :full_name, :date_of_birth, :address, :phone, :email,
              :status, :ssn, :passport, :nationality, :percentage

  def initialize(full_name, date_of_birth, address, phone, email, ssn, status = nil, passport = nil,
                 nationality = nil, percentage = nil)
    @full_name = full_name
    @date_of_birth = date_of_birth
    @address = address
    @phone = phone
    @email = email
    @status = status
    @ssn = ssn
    @passport = passport
    @nationality = nationality
    @percentage = percentage
  end

  def self.from_json_api(list)
    beneficial_owners = []
    list.map do |data|
      beneficial_owners << BeneficialOwner.new(data["fullName"], data["dateOfBirth"], data["address"], data["phone"], data["email"],
                                               data["ssn"], data["status"], data["passport"], data["nationality"], data["percentage"])
    end
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
    payload["passport"] = passport if passport
    payload["nationality"] = nationality if nationality
    payload["percentage"] = percentage if percentage
    payload
  end
end
