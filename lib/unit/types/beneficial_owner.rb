# frozen_string_literal: true

module Unit
  module Types
    class BeneficialOwner
      attr_reader :full_name, :date_of_birth, :address, :phone, :email,
                  :status, :ssn, :passport, :nationality, :percentage

      # @param full_name [FullName]
      # @param date_of_birth [Date]
      # @param address [Address]
      # @param phone [Phone]
      # @param email [String]
      # @param ssn [String]
      # @param status [String] - optional
      # @param passport [String] - optional
      # @param nationality [String] - optional
      # @param percentage [Integer] - optional
      # @param evaluation_params [EvaluationParams] - optional
      # @param id_theft_score [Integer] - optional
      # @param occupation [String] - optional
      # @param annual_income [String] - optional
      # @param source_of_income [String] - optional
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
  end
end
