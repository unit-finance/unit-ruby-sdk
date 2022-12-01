# frozen_string_literal: true

require_relative "../types/es/full_name"
require_relative "../types/address"
require_relative "../types/phone"
require_relative "../types/device_fingerprint"

class CreateIndividualApplicationRequest
  attr_reader :type, :ssn, :full_name, :date_of_birth, :address, :email, :phone, :ip, :ein, :industry, :dba, :sole_proprietorship,
              :passport, :nationality, :device_fingerprints, :idempotency_key, :tags, :jwt_subject, :power_of_attorney_agent,
              :evaluation_params

  # @param [String] ssn
  # @param [FullName] full_name
  # @param [Date] date_of_birth
  # @param [Address] address
  # @param [String] email
  # @param [Phone] phone
  # @param ip [String] optional
  # @param optional [String] ein
  # @param optional [String] industry
  # @param optional [String] dba
  # @param optional [Boolean] sole_proprietorship
  # @param optional [String] passport
  # @param optional [String] nationality
  # @param optional [DeviceFingerprint] device_fingerprints
  # @param optional [String] idempotency_key
  # @param optional [Hash] tags
  # @param optional [String] jwt_subject
  # @param optional [PowerOfAttorneyAgent] power_of_attorney_agent
  # @param optional [EvaluationParams] evaluation_params
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
