# frozen_string_literal: true

require "unit/types/full_name"
require "unit/types/address"
require "unit/types/phone"
require "unit/types/device_fingerprint"

# Request to create an individual application
# See https://docs.unit.co/applications/#create-individual-application
class CreateIndividualApplicationRequest
  attr_reader :type, :ssn, :full_name, :date_of_birth, :address, :email, :phone, :ip, :ein, :industry, :dba, :sole_proprietorship,
              :passport, :nationality, :device_fingerprints, :idempotency_key, :tags, :jwt_subject, :power_of_attorney_agent,
              :evaluation_params

  # @param ssn [String] SSN (or ITIN) of the individual (numbers only). Either an ssn or passport is required.
  # @param full_name [FullName] Full name of the individual.
  # @param date_of_birth [Date] Date only (e.g. "2001-08-15").
  # @param address [Address] Address of the individual.
  # @param email [String] Email address of the individual.
  # @param phone [Phone] Phone number of the individual.
  # @param optional ip [String]  IP address of the end-customer creating the application. Both IPv4 and IPv6 formats are supported. Highly recommended as a fraud prevention measure, if the information is available when submitting the application.
  # @param optional ein [String] If the individual is a sole proprietor who has an Employer Identification Number, specify it here. Not all sole proprietors have an EIN, so this attribute is optional, even when soleProprietorship is set to true.
  # @param optional industry [String] If the individual is a sole proprietor, specify the business industry here.
  # @param optional dba [String] If the individual is a sole proprietor who is doing business under a different name, specify it here. This attribute is optional, even when soleProprietorship is set to true.
  # @param optional sole_proprietorship [Boolean]  Default: false. Indicates whether the individual is a sole proprietor.
  # @param optional passport [String] Passport number of the individual. Valid only for non-US persons. Either an ssn or passport number is required.
  # @param optional nationality [String] Required if a passport is used as the main ID. Two letters representing the individual nationality. (e.g. "US").
  # @param optional device_fingerprints [DeviceFingerprint]  A list of device fingerprints for fraud and risk prevention. See: https://docs.unit.co/applications#device-fingerprints
  # @param optional idempotency_key [String] See: https://docs.unit.co/#intro-idempotency
  # @param optional tags [Hash] See: https://docs.unit.co/#tags. Tags that will be copied to the customer that this application creates. See: https://docs.unit.co/#tag-inheritance
  # @param optional jwt_subject [String] See: https://docs.unit.co/customer-api-tokens/#customers-create-customer-bearer-token-jwt for more information.
  # @param optional power_of_attorney_agent [PowerOfAttorneyAgent] The details of the person that will act as the agent that has power of attorney.
  # @param optional evaluation_params [EvaluationParams] Evaluation Params for this entity.
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
