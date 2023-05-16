# frozen_string_literal: true

module Unit
  # Create application form request
  # @see https://docs.unit.co/application-forms/#create-application-form
  module ApplicationForm
    class CreateApplicationFormRequest
      attr_reader :tags, :applicant_details, :allowed_application_types, :lang,
                  :settings_override, :require_id_verification, :hide_application_progress_tracker

      # @param tags [Hash] - optional
      # @param applicant_details [ApplicationFormPrefill] - optional
      # @parma allowed_application_types [Array<String>] - optional
      # @param lang [String] - optional
      # @param settings_override [ApplicationFormSettingsOverride] - optional
      # @param require_id_verification [RequireIdVerification] - optional
      # @param hide_application_progress_tracker [Boolean] - optional
      def initialize(tags = nil, applicant_details = nil, allowed_application_types = nil, lang = nil, settings_override = nil, require_id_verification = nil, hide_application_progress_tracker = nil)
        @tags = tags
        @applicant_details = applicant_details&.represent
        @allowed_application_types = allowed_application_types
        @lang = lang
        @settings_override = settings_override&.represent
        @require_id_verification = require_id_verification&.represent
        @hide_application_progress_tracker = hide_application_progress_tracker
      end

      def to_json_api
        payload = {
          data: {
            type: "applicationForm",
            attributes: {
              tags: tags,
              applicantDetails: applicant_details,
              allowedApplicationTypes: allowed_application_types,
              lang: lang,
              settingsOverride: settings_override,
              requireIdVerification: require_id_verification,
              hideApplicationProgressTracker: hide_application_progress_tracker
            }
          }
        }
        payload[:data][:attributes].compact!
        payload.to_json
      end
    end
  end
end
