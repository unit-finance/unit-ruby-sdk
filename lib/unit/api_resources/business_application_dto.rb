# frozen_string_literal: true

require "sorbet-runtime"

require_relative "../types/full_name"
require_relative "../types/address"
require_relative "../types/phone"
require_relative "../types/business_contact"
require_relative "../types/officer"
require_relative "../types/beneficial_owner"

class BusinessApplicationDto
  extend T::Sig

  attr_reader :id, :created_at, :name, :address, :phone, :status, :state_of_incorporation,
              :entity_type, :contact, :officer, :beneficial_owners, :ssn, :message, :ip, :ein, :dba,
              :tags, :relationships

  sig do
    params(id: String, created_at: String, name: String, address: Address, phone: Phone, status: String,
           state_of_incorporation: String, entity_type: String, contact: BusinessContact, officer: Officer,
           beneficial_owners: Array, ssn: T.nilable(String), message: T.nilable(String), ip: T.nilable(String),
           ein: T.nilable(String), dba: T.nilable(String), tags: T.nilable(Hash), relationships: T.nilable(Hash)).void
  end
  def initialize(id, created_at, name, address, phone, status,
                 state_of_incorporation, entity_type, contact, officer, beneficial_owners, ssn = nil, message = nil,
                 ip = nil, ein = nil, dba = nil, tags = nil, relationships = nil)
    @id = id
    @type = "businessApplication"
    @attributes = { createdAt: created_at,
                    name: name,
                    address: address,
                    phone: phone,
                    status: status,
                    ssn: ssn,
                    stateOfIncorporation: state_of_incorporation,
                    message: message,
                    ip: ip,
                    ein: ein,
                    entity_type: entity_type,
                    dba: dba,
                    contact: contact,
                    officer: officer,
                    beneficial_owners: beneficial_owners,
                    tags: tags }.to_json
    @relationships = relationships
  end

  def self.from_json_api(id, _type, attributes, relationships)
    BusinessApplicationDto.new(id, attributes["createdAt"], attributes["name"], Address.from_json_api(attributes["address"]), Phone.from_json_api(attributes["phone"]),
                               attributes["status"], attributes["stateOfIncorporation"], attributes["entityType"],
                               BusinessContact.from_json_api(attributes["contact"]), Officer.from_json_api(attributes["officer"]), BeneficialOwner.from_json_api(attributes["beneficialOwners"]),
                               attributes["ssn"], attributes["message"], attributes["ip"], attributes["ein"],
                               attributes["dba"], attributes["tags"], relationships)
  end
end
