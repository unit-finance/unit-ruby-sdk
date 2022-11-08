# frozen_string_literal: true

require "sorbet-runtime"
require_relative "../types/full_name"
require_relative "../types/address"
require_relative "../types/phone"
require_relative "../types/industry"

class CreateIndividualApplicationRequest
  attr_reader :type, :ssn, :full_name, :date_of_birth, :address, :email, :phone, :ip, :ein, :dba, :sole_proprietorship,
              :passport, :nationality, :device_fingerprints, :idempotency_key, :tags, :jwt_subject

  extend T::Sig

  sig do
    params(ssn: String, full_name: FullName, date_of_birth: String, address: Address, email: String, phone: Phone,
           ip: T.nilable(String), ein: T.nilable(String), dba: T.nilable(String), sole_proprietorship: T.nilable(T::Boolean),
           passport: T.nilable(String), nationality: T.nilable(String), device_fingerprints: T.nilable(Unit),
           idempotency_key: String, tags: T.nilable(Hash), jwt_object: String).void
  end
  def initialize(ssn, full_name, date_of_birth, address, email, phone, ip = nil, ein = nil, dba = nil, sole_proprietorship = nil, passport = nil,
                 nationality = nil, device_fingerprints = nil, idempotency_key = nil, tags = nil, jwt_object = nil)
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
    @jwt_object = jwt_object
    @type = "individualApplication"
  end

  def to_json_api
    {
      "data": {
        "type": type,
        "attributes": {
          "ssn": ssn,
          "fullName": full_name.represent,
          "dateOfBirth": date_of_birth,
          "address": address.represent,
          "email": email,
          "phone": phone.represent
        }
      }
    }.to_json
  end
end
