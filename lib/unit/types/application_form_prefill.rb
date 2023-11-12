# frozen_string_literal: true

# Type representing application form prefill
# @see https://docs.unit.co/types#applicationformprefill
module Unit
  module Types
    class ApplicationFormPrefill
      attr_reader :application_type, :full_name, :ssn, :passport, :nationality, :date_of_birth, :email,
                  :name, :state_of_incorporation, :entity_type, :contact, :officer, :beneficial_owners,
                  :website, :dba, :ein, :industry, :address, :phone, :jwt_subject,
                  :occupation, :annual_income, :source_of_income, :business_vertical,
                  :annual_revenue, :number_of_employees, :cash_flow, :year_of_incorporation,
                  :countries_of_operation, :stock_symbol, :has_non_us_entities

      # @param application_type [Array<String>] - optional
      # @param full_name [FullName] - optional
      # @param ssn [String] - optional
      # @param passport [String] - optional
      # @param nationality [String] - optional
      # @param date_of_birth [Date] - optional
      # @param email [String] - optional
      # @param name [String] - optional
      # @param state_of_incorporation [String] - optional
      # @param entity_type [String] - optional
      # @param contact [BusinessContact] - optional
      # @param officer [Officer] - optional
      # @param beneficial_owners [Array<BeneficialOwner>] - optional
      # @param website [String] - optional
      # @param dba [String] - optional
      # @param ein [String] - optional
      # @param industry [String] - optional
      # @param address [Address] - optional
      # @param phone [Phone] - optional
      # @param occupation [String] - optional
      # @param annual_income [String] - optional
      # @param source_of_income [String] - optional
      # @param business_vertical [String] - optional
      # @param annual_revenue [String] - optional
      # @param number_of_employees [String] - optional
      # @param cash_flow [String] - optional
      # @param year_of_incorporation [String] - optional
      # @param countries_of_operation [Array<String>] - optional
      # @param stock_symbol [String] - optional
      # @param has_non_us_entities [Boolean] - optional
      # @param jwt_subject [String] - optional
      def initialize(application_type = nil, full_name = nil, ssn = nil, passport = nil, nationality = nil,
                     date_of_birth = nil, email = nil, name = nil, state_of_incorporation = nil, entity_type = nil,
                     contact = nil, officer = nil, beneficial_owners = nil, website = nil, dba = nil, ein = nil,
                     industry = nil, address = nil, phone = nil, occupation = nil, annual_income = nil,
                     source_of_income = nil, business_vertical = nil,
                     annual_revenue = nil, number_of_employees = nil, cash_flow = nil, year_of_incorporation = nil,
                     countries_of_operation = nil, stock_symbol = nil, has_non_us_entities = nil, jwt_subject = nil)

        @application_type = application_type
        @full_name = full_name
        @ssn = ssn
        @passport = passport
        @nationality = nationality
        @date_of_birth = date_of_birth
        @email = email
        @name = name
        @state_of_incorporation = state_of_incorporation
        @entity_type = entity_type
        @contact = contact
        @officer = officer
        @beneficial_owners = beneficial_owners
        @website = website
        @dba = dba
        @ein = ein
        @industry = industry
        @address = address
        @phone = phone
        @jwt_subject = jwt_subject
        @occupation = occupation
        @annual_income = annual_income
        @source_of_income = source_of_income
        @business_vertical = business_vertical
        @annual_revenue = annual_revenue
        @number_of_employees = number_of_employees
        @cash_flow = cash_flow
        @year_of_incorporation = year_of_incorporation
        @countries_of_operation = countries_of_operation
        @stock_symbol = stock_symbol
        @has_non_us_entities = has_non_us_entities
      end

      def represent
        payload = {
          applicationType: application_type,
          fullName: full_name&.represent,
          ssn: ssn,
          passport: passport,
          nationality: nationality,
          dateOfBirth: date_of_birth,
          email: email,
          name: name,
          stateOfIncorporation: state_of_incorporation,
          entityType: entity_type,
          contact: contact&.represent,
          officer: officer&.represent,
          beneficialOwners: beneficial_owners,
          website: website,
          dba: dba,
          ein: ein,
          industry: industry,
          address: address&.represent,
          phone: phone&.represent,
          jwtSubject: jwt_subject,
          occupation: occupation,
          annualIncome: annual_income,
          sourceOfIncome: source_of_income,
          businessVertical: business_vertical,
          annualRevenue: annual_revenue,
          numberOfEmployees: number_of_employees,
          cashFlow: cash_flow,
          yearOfIncorporation: year_of_incorporation,
          countriesOfOperation: countries_of_operation,
          stockSymbol: stock_symbol,
          hasNonUsEntities: has_non_us_entities
        }
        payload.compact
      end
    end
  end
end
