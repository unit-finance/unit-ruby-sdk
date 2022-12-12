# frozen_string_literal: true

require "unit/types/full_name"
require "unit/types/address"
require "unit/types/phone"
require "unit/types/business_contact"
require "unit/types/beneficial_owner"
require "unit/types/officer"

# Request to create a business application
# See: https://docs.unit.co/applications/#create-business-application
module Unit
  module Application
    class CreateBusinessApplicationRequest
      attr_reader :name, :address, :phone, :state_of_incorporation, :ein, :industry, :contact, :officer, :beneficial_owners,
                  :entity_type, :dba, :ip, :website, :tags, :idempotency_key, :device_fingerprints, :type

      # @param name [String]
      # @param address [Address]
      # @param phone [Phone]
      # @param state_of_incorporation [String]
      # @param ein [String]
      # @param industry [String]
      # @param contact [BusinessContact]
      # @param officer [Officer]
      # @param beneficial_owners [Array]
      # @param entity_type [String]
      # @param dba [String] - optional
      # @param ip [String] - optional
      # @param website [String] - optional
      # @param tags [Hash] - optional
      # @param idempotency_key [String] - optional
      # @param device_fingerprints [DeviceFingerprint] - optional
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
  end
end
