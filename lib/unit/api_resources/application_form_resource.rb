# frozen_string_literal: true

require_relative "./base_resource"
require_relative "../utils/http_helper"
require "json"

# class for creating requests for application forms to Unit API and parsing responses
# @see https://docs.unit.co/application-forms
module Unit
  module Resource
    class ApplicationFormResource < Unit::Resource::BaseResource
      class << self
        # Create a new application form by calling Unit's API
        # @param request [CreateApplicationFormRequest] request
        # @return [UnitResponse, UnitError]
        def create_application_form(request)
          payload = request.to_json_api
          response = HttpHelper.post("#{api_url}/application-forms", body: payload, headers: headers)
          response_handler(response)
        end

        # Get application form by calling Unit's API
        # @param application_form_id [String]
        # @return [UnitResponse, UnitError]
        def get_application_form(application_form_id)
          response = HttpHelper.get("#{api_url}/application-forms/#{application_form_id}", headers: headers)
          response_handler(response)
        end

        # List application forms by calling Unit's API
        # @param params [ListApplicationFormParams]
        # @return [UnitResponse, UnitError]
        def list_application_forms(params = nil)
          response = HttpHelper.get("#{api_url}/application-forms", headers: headers, params: params.to_hash)
          response_handler(response)
        end
      end
    end
  end
end
