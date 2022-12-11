# frozen_string_literal: true

require_relative "full_name"
require_relative "phone"

module Unit
  module Types
    class BusinessContact
      attr_reader :full_name, :email, :phone

      # @param [FullName] full_name
      # @param [String] email
      # @param [Phone] phone
      def initialize(full_name, email, phone)
        @full_name = full_name
        @email = email
        @phone = phone
      end

      def represent
        {
          fullName: full_name.represent,
          email: email,
          phone: phone.represent
        }
      end
    end
  end
end
