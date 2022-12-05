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
  # @param industry [String] The business industry. One of: Retail, Wholesale, Restaurants, Hospitals, Construction, Insurance, Unions, RealEstate, FreelanceProfessional, OtherProfessionalServices, OnlineRetailer, OtherEducationServices.
  # @param contact [BusinessContact] Primary contact of the business. This person is the one that will have access to the account.
  # @param officer [Officer] Officer representing the business (must be the CEO, COO, CFO, President, BenefitsAdministrationOfficer, CIO, VP, AVP, Treasurer, Secretary, Controller, Manager, Partner or Member).
  # @param beneficial_owners [Array]Array of beneficial owners in the business. Beneficial owners are all people that, directly or indirectly, own 25% or more of the business. To onboard a business successfully, you must provide each beneficial owner's personal details. If the business has no beneficial owners, the array should be empty.
  # @param entity_type [String] One of the following: "Corporation", "LLC", "Partnership"
  # @param optional dba [String] Doing business as
  # @param optional ip [String]  IP address of the end-customer creating the application. Both IPv4 and IPv6 formats are supported. Highly recommended as a fraud prevention measure, if the information is available when submitting the application.
  # @param optional website [String] Business's website.
  # @param optional tags [Hash] See: https://docs.unit.co/#tags. Tags that will be copied to the customer that this application creates (see: https://docs.unit.co/#tag-inheritance).
  # @param optional idempotency_key [String] See: https://docs.unit.co/#intro-idempotency
  # @param optional device_fingerprints [DeviceFingerprint]  list of device fingerprints for fraud and risk prevention. See: https://docs.unit.co/applications#device-fingerprints

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
