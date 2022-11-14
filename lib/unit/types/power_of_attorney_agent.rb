# frozen_string_literal: true

require "sorbet-runtime"
require_relative "full_name"
require_relative "address"
require_relative "phone"
require_relative "jwt_subject"
    class PowerOfAttorneyAgent
      extend T::Sig

      sig do
        params(status: String, full_name: FullName, ssn: String,
               passport: String, nationality: String, date_of_birth: String,
               address: Address, phone: Phone, email: String,
               jwt_subject: Unit::Types::JwtSubject).void
      end
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
    end

