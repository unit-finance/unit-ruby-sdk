# frozen_string_literal: true

# Type representing application form prefill
# @see https://docs.unit.co/types#applicationformprefill
module Unit
  module Types
    class ApplicationFormPrefill
      attr_reader :application_type, :full_name, :ssn, :passport, :nationality, :date_of_birth, :email,
                  :name, :state_of_incorporation, :entity_type, :contact, :officer, :beneficial_owners,
                  :website, :dba, :ein, :industry, :address, :phone, :jwt_subject

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
      def initialize(application_type = nil, full_name = nil, ssn = nil, passport = nil, nationality = nil,
                     date_of_birth = nil, email = nil, name = nil, state_of_incorporation = nil, entity_type = nil,
                     contact = nil, officer = nil, beneficial_owners = nil, website = nil, dba = nil, ein = nil,
                     industry = nil, address = nil, phone = nil, jwt_subject = nil)
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
          jwtSubject: jwt_subject
        }
        payload.compact
      end
    end
  end
end
