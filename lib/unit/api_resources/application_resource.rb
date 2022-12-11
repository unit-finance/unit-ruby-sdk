# frozen_string_literal: true

require "httparty"

require_relative "../api_resources/base_resource"
require_relative "../models/applications/create_business_application_request"
require_relative "../models/applications/create_individual_application_request"
require_relative "../models/applications/patch_application_request"
require_relative "../models/applications/list_application_params"

require_relative "../models/unit_response"
require_relative "../errors/unit_error"
require "json"

# class for creating requests for applications to Unit API and parsing responses
# See: https://docs.unit.co/applications
class Unit::ApplicationResource < Unit::BaseResource
  # Create a new application by calling Unit's API
  # @param [CreateIndividualApplicationRequest, CreateBusinessApplicationRequest] request
  # @return [UnitResponse, UnitError]
  def create_application(request)
    payload = request.to_json_api
    response = HTTParty.post("#{api_url}/applications", body: payload, headers: headers)
    response_handler(response)
  end

  # Get an application by calling Unit's API
  # @param [Integer] application_id
  # @return [UnitResponse, UnitError]
  def get_application(application_id)
    response = HTTParty.get("#{api_url}/applications/#{application_id}", headers: headers)
    response_handler(response)
  end

  # Get an applications by calling Unit's API
  # @param [ListApplicationParams] params
  # @return [UnitResponse, UnitError]
  def list_applications(params = nil)
    response = HTTParty.get("#{api_url}/applications", body: params&.to_hash&.to_json, headers: headers)

    response_handler(response)
  end

  # Upload a document to an application
  # @param [UploadDocumentRequest] request
  # @return [UnitResponse, UnitError]
  def upload(request)
    url = "#{api_url}/applications/#{request.application_id}/documents/#{request.document_id}"
    url += "/back" if request.is_back_side

    headers = {
      "Authorization" => "Bearer #{token}",
      "User-Agent" => "unit-ruby-sdk"
    }

    headers["Content-Type"] = "application/pdf" if request.file_type == "pdf"
    headers["Content-Type"] = "image/jpeg" if request.file_type == "jpeg"
    headers["Content-Type"] = "image/png" if request.file_type == "png"

    response = HTTParty.put(url, body: request.file, headers: headers)

    response_handler(response)
  end

  # Update an application by calling Unit's API
  # @param [PatchApplicationRequest] request
  # @return [UnitResponse, UnitError]
  def update(request)
    payload = request.to_json_api
    response = HTTParty.patch("#{api_url}/applications/#{request.application_id}", body: payload, headers: headers)
    response_handler(response)
  end
end