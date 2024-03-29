# frozen_string_literal: true

module Unit
  module Types
    class PowerOfAttorneyAgent
      attr_reader :full_name, :ssn, :passport, :nationality,
                  :date_of_birth, :address, :phone, :email, :jwt_subject

      # @param [FullName] full_name
      # @param [String] ssn
      # @param [String] nationality
      # @param [Date] date_of_birth
      # @param [Address] address
      # @param [Phone] phone
      # @param [String] email
      # @param [String] passport - optional
      # @param [String] jwt_subject - optional
      def initialize(full_name, ssn, nationality, date_of_birth, address, phone, email, passport = nil, jwt_subject = nil)
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
          fullName: full_name.represent,
          ssn: ssn,
          passport: passport,
          nationality: nationality,
          dateOfBirth: date_of_birth,
          address: address.represent,
          phone: phone.represent,
          email: email,
          jwtSubject: jwt_subject
        }.compact!
      end
    end
  end
end
