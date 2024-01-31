# frozen_string_literal: true

module Unit
  module ApplicationForm
    APPLICATION_FORM_LIST_LIMIT = 100
    APPLICATION_FORM_LIST_OFFSET = 0
    autoload :CreateApplicationFormRequest, "unit/models/application_form/create_application_form_request"
    autoload :ListApplicationFormParams, "unit/models/application_form/list_application_form_params"
    class << self
      # Create an application form by calling Unit's API
      # @see https://docs.unit.co/application-forms/#create-application-form
      # @param tags [Hash] - optional
      # @param applicant_details [ApplicationFormPrefill] - optional
      # @parma allowed_application_types [Array<String>] - optional
      # @param lang [String] - optional
      # @param settings_override [ApplicationFormSettingsOverride] - optional
      # @param require_id_verification [RequireIdVerification] - optional
      # @param hide_application_progress_tracker [Boolean] - optional
      def create_application_form(tags: nil, applicant_details: nil, allowed_application_types: nil, lang: nil, settings_override: nil, require_id_verification: nil, hide_application_progress_tracker: nil)
        request = Unit::ApplicationForm::CreateApplicationFormRequest.new(tags, applicant_details, allowed_application_types, lang, settings_override, require_id_verification, hide_application_progress_tracker)
        Unit::Resource::ApplicationFormResource.create_application_form(request)
      end

      # Get an application form by calling Unit's API
      # @see https://docs.unit.co/application-forms#get-application-form-by-id
      # @param application_form_id [String]
      def get_application_form(application_form_id)
        Unit::Resource::ApplicationFormResource.get_application_form(application_form_id)
      end

      # List application forms by calling Unit's API
      # @see https://docs.unit.co/application-forms#list-application-forms
      # @param limit [Integer] - optional
      # @param offset [Integer] - optional
      # @param tags [Hash] - optional
      # @param sort [String] - optional
      def list_application_forms(limit: APPLICATION_FORM_LIST_LIMIT, offset: APPLICATION_FORM_LIST_OFFSET, tags: nil, sort: nil)
        request = Unit::ApplicationForm::ListApplicationFormParams.new(limit, offset, tags, sort)
        Unit::Resource::ApplicationFormResource.list_application_forms(request)
      end
    end
  end
end
