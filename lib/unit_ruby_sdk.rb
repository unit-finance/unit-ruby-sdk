# frozen_string_literal: true

require_relative "unit/version"

module Unit
  module Resource
    autoload :ApplicationResource, "unit/api_resources/application_resource"
    autoload :CustomerResource, "unit/api_resources/customer_resource"
  end
  module Application
    autoload :CreateBusinessApplicationRequest, "unit/models/application/create_business_application_request"
    autoload :CreateIndividualApplicationRequest, "unit/models/application/create_individual_application_request"
    autoload :ListApplicationParams, "unit/models/application/list_application_params"
    autoload :PatchApplicationRequest, "unit/models/application/patch_application_request"
    autoload :UploadDocumentRequest, "unit/models/application/upload_document_request"
  end
  module Customer
    autoload :AddAuthorizedUsersRequest, "unit/models/customer/add_authorized_users_request"
    autoload :ArchiveCustomerRequest, "unit/models/customer/archive_customer_request"
    autoload :ListCustomerParams, "unit/models/customer/list_customer_params"
    autoload :PatchBusinessCustomerRequest, "unit/models/customer/patch_business_customer_request"
    autoload :PatchIndividualCustomerRequest, "unit/models/customer/patch_individual_customer_request"
    autoload :RemoveAuthorizedUsersRequest, "unit/models/customer/remove_authorized_users_request"
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

  # Configure Unit SDK
  # @param [Hash] new_config If passed, update config
  # @return [Hash] current config
  def self.config(new_config=nil)
    @@config ||= new_config
  end
end
