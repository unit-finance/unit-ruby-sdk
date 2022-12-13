# frozen_string_literal: true

require_relative "unit/version"

module Unit
  autoload :Application, "unit/models/application/application"
  autoload :Customer, "unit/customer/customer"

  module Resource
    autoload :ApplicationResource, "unit/api_resources/application_resource"
    autoload :CustomerResource, "unit/api_resources/customer_resource"
  end

  module Types
    autoload :Address, "unit/types/address"
    autoload :AuthorizedUser, "unit/types/authorized_user"
    autoload :BeneficialOwner, "unit/types/beneficial_owner"
    autoload :BusinessContact, "unit/types/business_contact"
    autoload :DeviceFingerprint, "unit/types/device_fingerprint"
    autoload :EvaluationParams, "unit/types/evaluation_params"
    autoload :FullName, "unit/types/full_name"
    autoload :Officer, "unit/types/officer"
    autoload :Phone, "unit/types/phone"
    autoload :PowerOfAttorneyAgent, "unit/types/power_of_attorney_agent"
    autoload :Relationship, "unit/types/relationship"
    autoload :RelationshipArray, "unit/types/relationship_array"
  end

  autoload :UnitErrorPayload, "unit/errors/unit_error_payload"
  autoload :UnitError, "unit/errors/unit_error"
  autoload :UnitResponse, "unit/models/unit_response"
  autoload :UnitResource, "unit/models/unit_resource"

  # Configure Unit SDK - acts both as a setter and a getter
  # If params are passed, updates config
  # @param [String] api_url
  # @param [String] token
  # @return [Hash] current (updated) config
  def self.config(api_url: nil, token: nil)
    @@config ||= {}
    @@config[:api_url] = api_url if api_url
    @@config[:token] = token if token

    @@config
  end
end
