# frozen_string_literal: true

require_relative "../types/full_name"
require_relative "../types/address"
require_relative "../types/phone"
require_relative "../types/device_fingerprint"

class CreateIndividualApplicationRequest
  attr_reader :type, :ssn, :full_name, :date_of_birth, :address, :email, :phone, :ip, :ein, :dba, :sole_proprietorship,
              :passport, :nationality, :device_fingerprints, :idempotency_key, :tags, :jwt_subject

  # @param [String] ssn
  # @param [FullName] full_name
  # @param [Date] date_of_birth
  # @param [Address] address
  # @param [String] email
  # @param [Phone] phone
  # @param ip [String] optional
  # @param optional [String] ein
  # @param optional [String] dba
  # @param optional [Boolean] sole_proprietorship
  # @param optional [String] passport
  # @param optional [String] nationality
  # @param optional [DeviceFingerprint] device_fingerprints
  # @param optional [String] idempotency_key
  # @param optional [Hash] tags
  # @param optional [String] jwt_subject
  def initialize(ssn, full_name, date_of_birth, address, email, phone, ip = nil, ein = nil, dba = nil, sole_proprietorship = nil, passport = nil,
                 nationality = nil, device_fingerprints = nil, idempotency_key = nil, tags = nil, jwt_subject = nil)
    @ssn = ssn
    @full_name = full_name
    @date_of_birth = date_of_birth
    @address = address
    @phone = phone
    @email = email
    @ip = ip
    @ein = ein
    @dba = dba
    @sole_proprietorship = sole_proprietorship
    @passport = passport
    @nationality = nationality
    @device_fingerprints = device_fingerprints
    @idempotency_key = idempotency_key
    @tags = tags
    @jwt_object = jwt_subject
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
          dba: dba,
          soleProprietorship: sole_proprietorship,
          passport: passport,
          nationality: nationality,
          idempotencyKey: idempotency_key,
          tags: tags,
          jwtSubject: jwt_subject
        }
      }
    }
    payload[:data][:attributes].compact!
    payload.to_json
  end
end
