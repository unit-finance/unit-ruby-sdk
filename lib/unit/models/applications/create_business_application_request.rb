# frozen_string_literal: true

require_relative "../types/es/full_name"
require_relative "../types/address"
require_relative "../types/phone"
require_relative "../types/business_contact"
require_relative "../types/beneficial_owner"
require_relative "../types/officer"

class CreateBusinessApplicationRequest
  attr_reader :name, :address, :phone, :state_of_incorporation, :ein, :industry, :contact, :officer, :beneficial_owners,
              :entity_type, :dba, :ip, :website, :tags, :idempotency_key, :device_fingerprints, :type

  # @param name [String] The name of the business.
  # @param address [Address] Address of the business.
  # @param phone [Phone] Phone number of the business.
  # @param state_of_incorporation [String] Two letters representing a US state.
  # @param ein [String] Business EIN (numbers only).
  # @param industry [String] The business industry.
  # @param contact [BusinessContact] Primary contact of the business.
  # @param officer [Officer] Officer representing the business
  # @param beneficial_owners [Array]Array of beneficial owners in the business.
  # @param entity_type [String] One of the following: "Corporation", "LLC", "Partnership"
  # @param optional dba [String] Doing business as
  # @param optional ip [String]  IP address of the end-customer creating the application.
  # @param optional website [String] Business's website.
  # @param optional tags [Hash] See: https://docs.unit.co/#tags.
  # @param optional idempotency_key [String] See: https://docs.unit.co/#intro-idempotency
  # @param optional device_fingerprints [DeviceFingerprint] List of device fingerprints for fraud and risk prevention
  # See for more information: https://docs.unit.co/applications/#create-business-application
  def initialize(name, address, phone, state_of_incorporation, ein, industry, contact, officer,
                 beneficial_owners, entity_type, dba = nil, ip = nil, website = nil, tags = nil, idempotency_key = nil,
                 device_fingerprints = nil)
    @name = name
    @address = address
    @phone = phone
    @state_of_incorporation = state_of_incorporation
    @ein = ein
    @industry = industry
    @contact = contact
    @officer = officer
    @beneficial_owners = beneficial_owners.map(&:represent)
    @entity_type = entity_type
    @dba = dba
    @ip = ip
    @website = website
    @tags = tags
    @idempotency_key = idempotency_key
    @device_fingerprints = device_fingerprints
    @type = "businessApplication"
  end

  def to_json_api
    payload = {
      data: {
        type: type,
        attributes: {
          name: name,
          address: address.represent,
          phone: phone.represent,
          stateOfIncorporation: state_of_incorporation,
          ein: ein,
          industry: industry,
          contact: contact.represent,
          officer: officer.represent,
          beneficialOwners: beneficial_owners,
          entityType: entity_type,
          dba: dba,
          ip: ip,
          website: website
        }
      }
    }
    payload[:data][:attributes].compact!
    payload.to_json
  end
end
