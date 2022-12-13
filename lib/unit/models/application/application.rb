# frozen_string_literal: true

module Unit
  module Application
    APPLICATION_LIST_OFFSET = 0
    APPLICATION_LIST_LIMIT = 100
    autoload :CreateBusinessApplicationRequest, "unit/models/application/create_business_application_request"
    autoload :CreateIndividualApplicationRequest, "unit/models/application/create_individual_application_request"
    autoload :ListApplicationParams, "unit/models/application/list_application_params"
    autoload :PatchApplicationRequest, "unit/models/application/patch_application_request"
    autoload :UploadDocumentRequest, "unit/models/application/upload_document_request"

    class << self
      # Create a new business application by calling Unit's API
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
      # @return [UnitResponse, UnitError]
      def create_business_application(name:, address:, phone:, state_of_incorporation:, ein:, industry:, contact:,
                                      officer:, beneficial_owners:, entity_type:, dba: nil, ip: nil, website: nil,
                                      tags: nil, idempotency_key: nil, device_fingerprints: nil)

        request = CreateBusinessApplicationRequest.new(
          name, address, phone, state_of_incorporation, ein, industry, contact, officer,
          beneficial_owners, entity_type, dba, ip, website, tags, idempotency_key, device_fingerprints
        )

        Unit::Resource::ApplicationResource.create_application(request)
      end

      # Create a new individual application by calling Unit's API
      # @param ssn [String]
      # @param full_name [FullName]
      # @param date_of_birth [Date]
      # @param address [Address]
      # @param email [String]
      # @param phone [Phone]
      # @param ip [String] - optional
      # @param ein [String] - optional
      # @param industry [String] - optional
      # @param dba [String] - optional
      # @param sole_proprietorship [Boolean] - optional
      # @param passport [String] - optional
      # @param nationality [String] - optional
      # @param device_fingerprints [DeviceFingerprint] - optional
      # @param idempotency_key [String] - optional
      # @param tags [Hash] - optional
      # @param jwt_subject [String] - optional
      # @param power_of_attorney_agent [PowerOfAttorneyAgent] - optional
      # @param evaluation_params [EvaluationParams] - optional
      # @return [UnitResponse, UnitError]
      def create_individual_application(ssn:, full_name:, date_of_birth:, address:, email:, phone:, ip: nil, ein: nil,
                                        industry: nil, dba: nil, sole_proprietorship: nil, passport: nil, nationality: nil,
                                        device_fingerprints: nil, idempotency_key: nil, tags: nil, jwt_subject: nil,
                                        power_of_attorney_agent: nil, evaluation_params: nil)

        request = CreateIndividualApplicationRequest.new(
          ssn, full_name, date_of_birth, address, email, phone, ip, ein, industry, dba, sole_proprietorship, passport,
          nationality, device_fingerprints, idempotency_key, tags, jwt_subject, power_of_attorney_agent, evaluation_params
        )

        Unit::Resource::ApplicationResource.create_application(request)
      end

      # Update an application by calling Unit's API
      # @param application_id [String] The application id
      # @param type [String] The type
      # @param tags [String] The tags
      # @return [UnitResponse, UnitError]
      def update_application(application_id:, type:, tags: nil)
        request = PatchApplicationRequest.new(application_id, type, tags)
        Unit::Resource::ApplicationResource.update(request)
      end

      # List applications by calling Unit's API
      # @param offset [Integer] Number of resources to skip.
      # @param limit [Integer] The limit Maximum number of resources that will be returned.
      # @param email [String] Filter applications by email address (case sensitive).
      # @param tags [String] Filter applications by tags. More information regarding tags: https://docs.unit.co/#tags
      # @param query [String] Search term according to the: https://docs.unit.co/#full-text-search
      # @param status [String] Filter applications by status: https://docs.unit.co/applications/#application-statuses
      # @param sort [String] Sorts the resources by the specified field.
      # @option sort=createdAt for ascending order
      # @option sort=-createdAt (leading minus sign) for descending order.
      # @return [UnitResponse, UnitError]
      def list_applications(offset: APPLICATION_LIST_OFFSET, limit: APPLICATION_LIST_LIMIT, email: nil, tags: nil, query: nil, status: nil, sort: nil)
        request = Unit::Application::ListApplicationParams.new(offset, limit, email, tags, query, status, sort)
        Unit::Resource::ApplicationResource.list_applications(request)
      end

      # Get an application by calling Unit's API
      # @param [String] application_id
      # @return [UnitResponse, UnitError]
      def get_application(application_id)
        Unit::Resource::ApplicationResource.get_application(application_id)
      end

      # Upload an application document by calling Unit's API
      # @param application_id [String] The application ID
      # @param document_id [String] The document ID
      # @param file [String] The file path
      # @param file_type [String] The file type
      # @option file_type [String] :pdf
      # @option file_type [String] :jpg
      # @option file_type [String] :png
      # @param is_back_side [Boolean] The file is back side
      # @return [UnitResponse, UnitError]
      def upload_document(application_id:, document_id:, file:, file_type:, is_back_side: false)
        request = UploadDocumentRequest.new(application_id, document_id, file, file_type, is_back_side: is_back_side)
        Unit::Resource::ApplicationResource.upload(request)
      end
    end
  end
end
