# frozen_string_literal: true

# @see https://docs.unit.co/types#grantor
module Unit
  module Types
    class Grantor
      attr_reader :full_name, :date_of_birth, :ssn, :email, :phone, :address

      # @param full_name [FullName]
      # @param ssn [String]
      # @param email [String]
      # @param phone [Phone]
      # @param address [Address]
      # @param date_of_birth [Date] - optional
      def initialize(full_name, ssn, email, phone, address, date_of_birth = nil)
        @full_name = full_name
        @date_of_birth = date_of_birth
        @ssn = ssn
        @email = email
        @phone = phone
        @address = address
      end

      def represent
        payload = {
          fullName: full_name.represent,
          dateOfBirth: date_of_birth,
          ssn: ssn,
          email: email,
          phone: phone.represent,
          address: address.represent
        }
        payload.compact
      end
    end
  end
end
