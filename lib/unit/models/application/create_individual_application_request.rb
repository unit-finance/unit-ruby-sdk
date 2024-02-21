# frozen_string_literal: true

require "unit/types/full_name"
require "unit/types/address"
require "unit/types/phone"
require "unit/types/device_fingerprint"

# Request to create an individual application
# @see https://docs.unit.co/applications/#create-individual-application
module Unit
  module Application
    class CreateIndividualApplicationRequest
      attr_reader :type, :ssn, :full_name, :date_of_birth, :address, :email, :phone, :ip, :ein, :industry, :dba, :sole_proprietorship,
                  :passport, :nationality, :device_fingerprints, :idempotency_key, :tags, :jwt_subject, :power_of_attorney_agent,
                  :evaluation_params

      # @param ssn [String]
      # @param full_name [FullName]
      # @param date_of_birth [Date]
      # @param address [Address]
      # @param email [String]
      # @param phone [Phone]
      # @param ip [String] - optional
      # @param ein [String] - optional
      # @param industry [String] - optional
      # @param dba [String] - optional
      # @param sole_proprietorship [Boolean] - optional
      # @param passport [String] - optional
      # @param nationality [String] - optional
      # @param device_fingerprints [DeviceFingerprint] - optional
      # @param idempotency_key [String] - optional
      # @param tags [Hash] - optional
      # @param jwt_subject [String] - optional
      # @param power_of_attorney_agent [PowerOfAttorneyAgent] - optional
      # @param evaluation_params [EvaluationParams] - optional
      def initialize(ssn, full_name, date_of_birth, address, email, phone, ip = nil, ein = nil, industry = nil, dba = nil, sole_proprietorship = nil, passport = nil,
                     nationality = nil, device_fingerprints = nil, idempotency_key = nil, tags = nil, jwt_subject = nil, power_of_attorney_agent = nil,
                     evaluation_params = nil)
        @ssn = ssn
        @full_name = full_name
        @date_of_birth = date_of_birth
        @address = address
        @phone = phone
        @email = email
        @ip = ip
        @ein = ein
        @industry = industry
        @dba = dba
        @sole_proprietorship = sole_proprietorship
        @passport = passport
        @nationality = nationality
        @device_fingerprints = device_fingerprints
        @idempotency_key = idempotency_key
        @tags = tags
        @jwt_object = jwt_subject
        @power_of_attorney_agent = power_of_attorney_agent
        @evaluation_params = evaluation_params
        @type = "individualApplication"
      end

      def to_json_api
        payload = {
          data: {
            type: type,
            attributes: {
              ssn: ssn,
              fullName: full_name.represent,
              dateOfBirth: date_of_birth,
              address: address.represent,
              email: email,
              phone: phone.represent,
              ip: ip,
              ein: ein,
              industry: industry,
              dba: dba,
              soleProprietorship: sole_proprietorship,
              passport: passport,
              nationality: nationality,
              idempotencyKey: idempotency_key,
              tags: tags,
              jwtSubject: jwt_subject,
              powerOfAttorneyAgent: power_of_attorney_agent&.represent,
              evaluationParams: evaluation_params&.represent
            }
          }
        }
        payload[:data][:attributes].compact!
        payload.to_json
      end
    end
  end
end
