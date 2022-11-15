# frozen_string_literal: true

require "sorbet-runtime"

require_relative "../types/full_name"
require_relative "../types/address"
require_relative "../types/phone"
require_relative "../types/business_contact"
require_relative "../types/beneficial_owner"
require_relative "../types/officer"

class CreateBusinessApplicationRequest
  attr_reader :name, :address, :phone, :state_of_incorporation, :ein, :contact, :officer, :beneficial_owners,
              :entity_type, :dba, :ip, :website, :type

  extend T::Sig

  sig do
    params(name: String, address: Address, phone: Phone, state_of_incorporation: String,
           ein: String, contact: BusinessContact, officer: Officer, beneficial_owners: Array,
           entity_type: String, dba: T.nilable(String), ip: T.nilable(String), website: T.nilable(String)).void
  end
  def initialize(name, address, phone, state_of_incorporation, ein, contact, officer,
                 beneficial_owners, entity_type, dba = nil, ip = nil,
                 website = nil)
    @name = name
    @address = address
    @phone = phone
    @state_of_incorporation = state_of_incorporation
    @ein = ein
    @contact = contact
    @officer = officer
    @beneficial_owners = beneficial_owners.map(&:represent)
    @entity_type = entity_type
    @dba = dba
    @ip = ip
    @website = website
    @type = "businessApplication"
  end

  def to_json_api
    payload = {
      "data": {
        "type": type,
        "attributes": {
          "name": name,
          "address": address.represent,
          "phone": phone.represent,
          "stateOfIncorporation": state_of_incorporation,
          "ein": ein,
          "contact": contact.represent,
          "officer": officer.represent,
          "beneficialOwners": beneficial_owners,
          "entityType": entity_type
        }
      }
    }.to_json
    attributes = JSON.parse(payload)["data"]["attributes"]
    attributes["dba"] = dba if dba
    attributes["ip"] = ip if ip
    attributes["website"] = website if website
    payload
  end
end
