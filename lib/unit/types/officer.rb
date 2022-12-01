# frozen_string_literal: true

class Officer
  attr_reader :full_name, :date_of_birth, :address, :phone, :email,
              :status, :title, :ssn, :passport, :nationality

  # @param [FullName] full_name
  # @param [Date] date_of_birth
  # @param [Address] address
  # @param [Phone] phone
  # @param [String] email
  # @param [String] ssn
  # @param optional [String] status
  # @param optional [String] title
  # @param optional [String] passport
  # @param optional [String] nationality
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
        title: title,
        passport: passport,
        nationality: nationality
      }
    payload.compact
  end
end
