# frozen_string_literal: true

# Request to create a business application
# @see https://docs.unit.co/applications/#create-business-application
module Unit
  module Application
    class CreateBusinessApplicationRequest
      attr_reader :name, :address, :phone, :state_of_incorporation, :ein, :industry, :contact, :officer, :beneficial_owners,
                  :entity_type, :dba, :ip, :website, :tags, :idempotency_key, :device_fingerprints,
                  :annual_revenue, :number_of_employees, :cash_flow, :year_of_incorporation,
                  :countries_of_operation, :stock_symbol, :business_vertical, :type

      # @param name [String]
      # @param address [Address]
      # @param phone [Phone]
      # @param state_of_incorporation [String]
      # @param ein [String]
      # @param contact [BusinessContact]
      # @param officer [Officer]
      # @param beneficial_owners [Array]
      # @param entity_type [String]
      # @param industry [String] - optional
      # @param dba [String] - optional
      # @param ip [String] - optional
      # @param website [String] - optional
      # @param tags [Hash] - optional
      # @param idempotency_key [String] - optional
      # @param device_fingerprints [DeviceFingerprint] - optional
      # @param annual_revenue [String] - optional
      # @param number_of_employees [String] - optional
      # @param cash_flow [String] - optional
      # @param year_of_incorporation [String] - optional
      # @param countries_of_operation [Array<String>] - optional
      # @param stock_symbol [String] - optional
      # @param business_vertical [String] - optional
      def initialize(name, address, phone, state_of_incorporation, ein, contact, officer,
                     beneficial_owners, entity_type, industry = nil, dba = nil, ip = nil, website = nil, tags = nil, idempotency_key = nil,
                     device_fingerprints = nil, annual_revenue = nil, number_of_employees = nil,
                     cash_flow = nil, year_of_incorporation = nil, countries_of_operation = nil,
                     stock_symbol = nil, business_vertical = nil)
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
        @annual_revenue = annual_revenue
        @number_of_employees = number_of_employees
        @cash_flow = cash_flow
        @year_of_incorporation = year_of_incorporation
        @countries_of_operation = countries_of_operation
        @stock_symbol = stock_symbol
        @business_vertical = business_vertical
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
              website: website,
              tags: tags,
              idempotencyKey: idempotency_key,
              deviceFingerprints: device_fingerprints,
              annualRevenue: annual_revenue,
              numberOfEmployees: number_of_employees,
              cashFlow: cash_flow,
              yearOfIncorporation: year_of_incorporation,
              countriesOfOperation: countries_of_operation&.join(","),
              stockSymbol: stock_symbol,
              businessVertical: business_vertical
            }
          }
        }
        payload[:data][:attributes].compact!
        payload.to_json
      end
    end
  end
end