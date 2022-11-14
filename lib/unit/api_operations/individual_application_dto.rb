# frozen_string_literal: true

require "sorbet-runtime"

class IndividualApplicationDto
  extend T::Sig

  attr_reader :id, :created_at, :full_name, :address, :date_of_birth,
              :email, :phone, :status, :ssn, :message, :ip, :ein, :dba,
              :sole_proprietorship, :tags, :relationships, :attributes

  sig do
    params(id: String, created_at: String, full_name: FullName, address: Address, date_of_birth: Date,
           email: String, phone: Phone, status: String, ssn: T.nilable(String),
           message: T.nilable(String), ip: T.nilable(String), ein: T.nilable(String), dba: T.nilable(String),
           sole_proprietorship: T.nilable(T::Boolean), tags: T.nilable(Hash),
           relationships: Hash).void
  end
  def initialize(id, created_at, full_name, address, date_of_birth,
                 email, phone, status, ssn = nil, message = nil,
                 ip = nil, ein = nil, dba = nil,
                 sole_proprietorship = nil, tags = nil,
                 relationships = nil)
    @id = id
    @type = "individualApplication"
    @attributes = { createdAt: created_at,
                    fullName: full_name,
                    address: address,
                    dateOfBirth: date_of_birth,
                    email: email,
                    phone: phone,
                    status: status,
                    ssn: ssn,
                    message: message,
                    ip: ip,
                    ein: ein,
                    dba: dba,
                    soleProprietorship: sole_proprietorship,
                    tags: tags }.to_json
    @relationships = relationships
  end

  def self.from_json_api(id, _type, attributes, relationships)
    IndividualApplicationDto.new(id, attributes["createdAt"], FullName.from_json_api(attributes["fullName"]),
                                 Address.from_json_api(attributes["address"]), attributes["dateOfBirth"],
                                 attributes["email"], Phone.from_json_api(attributes["phone"]),
                                 attributes["status"], attributes["ssn"], attributes["message"],
                                 attributes["ip"], attributes["ein"], attributes["dba"], attributes["sole_proprietorship"],
                                 attributes["tags"], relationships)
  end
end
