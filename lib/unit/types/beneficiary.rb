# frozen_string_literal: true

# @see https://docs.unit.co/types#beneficiary
module Unit
  module Types
    class Beneficiary
      attr_reader :full_name, :date_of_birth

      # @param full_name [FullName]
      # @param date_of_birth [Date]
      def initialize(full_name, date_of_birth = nil)
        @full_name = full_name
        @date_of_birth = date_of_birth
      end

      def represent
        payload = {
          fullName: full_name.represent,
          dateOfBirth: date_of_birth
        }
        payload.compact
      end
    end
  end
end
