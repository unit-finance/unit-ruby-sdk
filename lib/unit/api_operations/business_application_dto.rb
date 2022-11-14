# frozen_string_literal: true


require "sorbet-runtime"

class BusinessApplicationDto
  extend T::Sig


  attr_reader :id, :created_at, :name, :address, :phone, :status, :state_of_incorporation,
              :entity_type, :contact, :officer, :beneficial_owners, :ssn, :message, :ip, :ein, :dba,
               :tags, :relationships

  sig do
    params(id: String, created_at: String, full_name: FullName, address: Address, date_of_birth: String,
           email: String, phone: Phone, status: String, ssn: T.nilable(String),
           message: T.nilable(String), ip: T.nilable(String), ein: T.nilable(String), dba: T.nilable(String),
           sole_proprietorship: T.nilable(T::Boolean), tags: T.nilable(Hash),
           relationships: Hash).void
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
    BusinessApplicationDto.new(id, attributes["createdAt"], attributes["name"], attributes["address"], attributes["phone"],
                               attributes["status"], attributes["stateOfIncorporation"], attributes["entityType"],
                               attributes["contact"], attributes["officer"], attributes["beneficialOwners"],
                               attributes["ssn"], attributes["message"], attributes["ip"], attributes["ein"],
                               attributes["dba"], attributes["tags"], relationships)
  end

end
