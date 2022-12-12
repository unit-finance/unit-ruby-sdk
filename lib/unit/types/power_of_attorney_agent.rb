# frozen_string_literal: true

require_relative "full_name"
require_relative "address"
require_relative "phone"

module Unit
  module Types
    class PowerOfAttorneyAgent
      attr_reader :status, :full_name, :ssn, :passport, :nationality,
                  :date_of_birth, :address, :phone, :email, :jwt_subject

      # @param [String] status
      # @param [FullName] full_name
      # @param [String] ssn
      # @param [String] passport
      # @param [String] nationality
      # @param [Date] date_of_birth
      # @param [Address] address
      # @param [Phone] phone
      # @param [String] email
      # @param [String] jwt_subject
      def initialize(status, full_name, ssn, passport, nationality, date_of_birth, address, phone, email, jwt_subject)
        @status = status
        @full_name = full_name
        @ssn = ssn
        @passport = passport
        @nationality = nationality
        @date_of_birth = date_of_birth
        @address = address
        @phone = phone
        @email = email
        @jwt_subject = jwt_subject
      end

      def represent
        {
          status: status,
          fullName: full_name.represent,
          ssn: ssn,
          passport: passport,
          nationality: nationality,
          dateOfBirth: date_of_birth,
          address: address.represent,
          phone: phone.represent,
          email: email,
          jwtSubject: jwt_subject
        }
      end
    end
  end
end
