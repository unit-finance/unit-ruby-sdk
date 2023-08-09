# frozen_string_literal: true

module Unit
  module Types
    class Officer
      attr_reader :full_name, :date_of_birth, :address, :phone, :email,
                  :status, :title, :ssn, :passport, :nationality,
                  :evaluation_params, :id_theft_score, :occupation,
                  :annual_income, :source_of_income

      # @param full_name [FullName]
      # @param date_of_birth [Date]
      # @param address [Address]
      # @param phone [Phone]
      # @param email [String]
      # @param ssn [String]
      # @param status [String] - optional
      # @param title [String] - optional
      # @param passport [String] - optional
      # @param nationality [String] - optional
      def initialize(full_name, date_of_birth, address, phone, email, ssn,
                     status = nil, title = nil, passport = nil,
                     nationality = nil, evaluation_params = nil, id_theft_score = nil, occupation = nil,
                     annual_income = nil, source_of_income = nil)
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
        @evaluation_params = evaluation_params
        @id_theft_score = id_theft_score
        @occupation = occupation
        @annual_income = annual_income
        @source_of_income = source_of_income
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
            title: title,
            passport: passport,
            nationality: nationality,
            evaluation_params: evaluation_params,
            id_theft_score: id_theft_score,
            occupation: occupation,
            annual_income: annual_income,
            source_of_income: source_of_income
          }
        payload.compact
      end
    end
  end
end
