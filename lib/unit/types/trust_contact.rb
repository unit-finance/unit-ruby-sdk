# frozen_string_literal: true

# @see https://docs.unit.co/types#trustcontact
module Unit
  module Types
    class TrustContact
      attr_reader :full_name, :email, :phone, :address, :jwt_subject

      # @param full_name [FullName]
      # @param email [String]
      # @param phone [Phone]
      # @param address [Address]
      # @param jwt_subject [String] - optional
      def initialize(full_name, email, phone, address, jwt_subject = nil)
        @full_name = full_name
        @email = email
        @phone = phone
        @address = address
        @jwt_subject = jwt_subject
      end

      def represent
        payload = {
          fullName: full_name.represent,
          email: email,
          phone: phone.represent,
          address: address.represent,
          jwtSubject: jwt_subject
        }
        payload.compact
      end
    end
  end
end
