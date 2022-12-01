# frozen_string_literal: true

class BeneficialOwner
  attr_reader :full_name, :date_of_birth, :address, :phone, :email,
              :status, :ssn, :passport, :nationality, :percentage

  # @param [FullName] full_name
  # @param [Date] date_of_birth
  # @param [Address] address
  # @param [Phone] phone
  # @param [String] email
  # @param [String] ssn
  # @param optional [String] status
  # @param optional [String] passport
  # @param optional [String] nationality
  # @param optional [Integer] percentage
  # @return [BeneficialOwner]
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

  # @return [Hash] The JSON API payload
  def represent
    payload =
      {
        fullName: full_name.represent,
        dateOfBirth: date_of_birth,
        address: address.represent,
        phone: phone.represent,
        email: email,
        ssn: ssn,
        status: status,
        passport: passport,
        nationality: nationality,
        percentage: percentage
      }
    payload.compact
  end
end
