# frozen_string_literal: true

# @see https://docs.unit.co/types#trustee
module Unit
  module Types
    class Trustee
      attr_reader :full_name, :ssn, :email, :phone, :address, :date_of_birth

      # @param full_name [FullName]
      # @param ssn [String]
      # @param email [String]
      # @param phone [Phone]
      # @param address [Address]
      # @param date_of_birth [Date] - optional
      def initialize(full_name, ssn, email, phone, address, date_of_birth = nil)
        @full_name = full_name
        @ssn = ssn
        @email = email
        @phone = phone
        @address = address
        @date_of_birth = date_of_birth
      end

      def represent
        payload = {
          fullName: full_name.represent,
          ssn: ssn,
          email: email,
          phone: phone.represent,
          address: address.represent,
          dateOfBirth: date_of_birth
        }
        payload.compact
      end
    end
  end
end
