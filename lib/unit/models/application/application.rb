# frozen_string_literal: true

module Unit
  module Application
    APPLICATION_LIST_OFFSET = 0
    APPLICATION_LIST_LIMIT = 100
    autoload :CreateBusinessApplicationRequest, "unit/models/application/create_business_application_request"
    autoload :CreateSoleProprietorApplicationRequest, "unit/models/application/create_sole_proprietor_application_request"
    autoload :CreateIndividualApplicationRequest, "unit/models/application/create_individual_application_request"
    autoload :ListApplicationParams, "unit/models/application/list_application_params"
    autoload :PatchApplicationRequest, "unit/models/application/patch_application_request"
    autoload :UploadDocumentRequest, "unit/models/application/upload_document_request"
    autoload :CreateTrustApplicationRequest, "unit/models/application/create_trust_application_request"
    autoload :PatchTrustApplicationRequest, "unit/models/application/patch_trust_application_request"
    class << self
      # Create a new business application by calling Unit's API
      # @see https://docs.unit.co/applications#create-business-application
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
      def create_business_application(name:, address:, phone:, state_of_incorporation:, ein:, contact:,
                                      officer:, beneficial_owners:, entity_type:, industry: nil, dba: nil, ip: nil, website: nil,
                                      tags: nil, idempotency_key: nil, device_fingerprints: nil, annual_revenue: nil, number_of_employees: nil,
                                      cash_flow: nil, year_of_incorporation: nil, countries_of_operation: nil, stock_symbol: nil, business_vertical: nil)

        request = CreateBusinessApplicationRequest.new(
          name, address, phone, state_of_incorporation, ein, contact, officer,
          beneficial_owners, entity_type, industry, dba, ip, website, tags, idempotency_key, device_fingerprints,
          annual_revenue, number_of_employees, cash_flow, year_of_incorporation, countries_of_operation, stock_symbol, business_vertical
        )

        Unit::Resource::ApplicationResource.create_application(request)
      end

      # Create a new individual application by calling Unit's API
      # @see https://docs.unit.co/applications#create-individual-application
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
      # @param occupation [String] - optional
      # @param annual_income [String] - optional
      # @param source_of_income [String] - optional
      # @return [UnitResponse, UnitError]
      def create_individual_application(ssn:, full_name:, date_of_birth:, address:, email:, phone:, ip: nil, ein: nil,
                                        industry: nil, dba: nil, sole_proprietorship: nil, passport: nil, nationality: nil,
                                        device_fingerprints: nil, idempotency_key: nil, tags: nil, jwt_subject: nil,
                                        power_of_attorney_agent: nil, evaluation_params: nil, occupation: nil, annual_income: nil, source_of_income: nil)

        request = CreateIndividualApplicationRequest.new(
          ssn, full_name, date_of_birth, address, email, phone, ip, ein, industry, dba, sole_proprietorship, passport,
          nationality, device_fingerprints, idempotency_key, tags, jwt_subject, power_of_attorney_agent, evaluation_params,
          occupation, annual_income, source_of_income
        )
        Unit::Resource::ApplicationResource.create_application(request)
      end

      # Create a new sole proprietor application by calling Unit's API
      # @see https://docs.unit.co/applications#create-sole-proprietor-application
      # @param nationality [String]
      # @param full_name [FullName]
      # @param date_of_birth [Date]
      # @param address [Address]
      # @param phone [Phone]
      # @param email [String]
      # @param sole_proprietorship [Boolean]
      # @param ssn [String] - optional
      # @param passport [String] - optional
      # @param ein [String] - optional
      # @param dba [String] - optional
      # @param power_of_attorney_agent [PowerOfAttorneyAgent] - optional
      # @param evaluation_params [EvaluationParams] - optional
      # @param annual_revenue [String] - optional
      # @param number_of_employees [String] - optional
      # @param business_vertical [String] - optional
      # @param website [String] - optional
      # @param ip [String] - optional
      # @param tags [Hash] - optional
      # @param idempotency_key [String] - optional
      # @param device_fingerprints [Array<DeviceFingerprint>] - optional
      # @param jwt_subject [String] - optional
      # @return [UnitResponse, UnitError]
      def create_sole_proprietor_application(nationality:, full_name:, date_of_birth:, address:, phone:,
                                             email:, ssn: nil, passport: nil, ein: nil, dba: nil, power_of_attorney_agent: nil, evaluation_params: nil,
                                             annual_revenue: nil, number_of_employees: nil, business_vertical: nil, website: nil, ip: nil, tags: nil,
                                             idempotency_key: nil, device_fingerprints: nil, jwt_subject: nil, sole_proprietorship: true)
        request = CreateSoleProprietorApplicationRequest.new(nationality, full_name, date_of_birth, address, phone,
                                                             email, ssn, passport, ein, dba, power_of_attorney_agent, evaluation_params,
                                                             annual_revenue, number_of_employees,
                                                             business_vertical, website, ip, tags, idempotency_key,
                                                             device_fingerprints, jwt_subject, sole_proprietorship: sole_proprietorship)
        Unit::Resource::ApplicationResource.create_application(request)
      end

      # Update an application by calling Unit's API
      # @see https://docs.unit.co/applications#update-individual-application
      # @param application_id [String] The application id
      # @param type [String] The type
      # @param tags [Hash] The tags
      # @return [UnitResponse, UnitError]
      def update_application(application_id:, type:, tags: nil)
        request = PatchApplicationRequest.new(application_id, type, tags)
        Unit::Resource::ApplicationResource.update(request)
      end

      # List applications by calling Unit's API
      # @see https://docs.unit.co/applications#list-applications
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
      # @see https://docs.unit.co/applications#get-application-by-id
      # @param [String] application_id
      # @return [UnitResponse, UnitError]
      def get_application(application_id)
        Unit::Resource::ApplicationResource.get_application(application_id)
      end

      # Upload an application document by calling Unit's API
      # @see https://docs.unit.co/application-documents#upload-document
      # @param application_id [String] The application ID
      # @param document_id [String] The document ID
      # @param file [String] The file content
      # @param file_type [String] The file type. One of the Unit::Types::DocumentFileType constants.
      # @param is_back_side [Boolean] The file is back side
      # @return [UnitResponse, UnitError]
      def upload_document(application_id:, document_id:, file:, file_type:, is_back_side: false)
        request = UploadDocumentRequest.new(application_id, document_id, file, file_type, is_back_side: is_back_side)
        Unit::Resource::ApplicationResource.upload(request)
      end

      # Create a trust application
      # @see https://docs.unit.co/applications/#create-trust-application
      # @param name [String]
      # @param state_of_incorporation [String]
      # @param revocability [String]
      # @param source_of_funds [String]
      # @param tax_id [String]
      # @param grantor [Grantor]
      # @param trustees [Array<Trustee>]
      # @param beneficiaries [Array<Beneficiary>]
      # @param contact [TrustContact]
      # @param ip [String] - optional
      # @param tags [Hash] - optional
      # @param idempotency_key [String] - optional
      # @param device_fingerprints [Array<DeviceFingerprint>] - optional
      def create_trust_application(name:, state_of_incorporation:, revocability:, source_of_funds:, tax_id:,
                                   grantor:, trustees:, beneficiaries:, contact:, ip: nil, tags: nil, idempotency_key: nil, device_fingerprints: nil)
        request = CreateTrustApplicationRequest.new(name, state_of_incorporation, revocability, source_of_funds, tax_id,
                                                    grantor, trustees, beneficiaries, contact, ip, tags, idempotency_key, device_fingerprints)
        Unit::Resource::ApplicationResource.create_application(request)
      end

      def update_trust_application(application_id:, tags: nil)
        request = PatchTrustApplicationRequest.new(application_id, tags)
        Unit::Resource::ApplicationResource.update(request)
      end
    end
  end
end
