# frozen_string_literal: true

require "httmultiparty"
require "httparty"

require_relative "../api_resources/base_resource"
require_relative "../models/create_business_application_request"
require_relative "../models/create_individual_application_request"
require_relative "../models/patch_application_request"
require_relative "../models/list_application_params"

require_relative "../types/full_name"
require_relative "../types/address"
require_relative "../types/phone"
require_relative "../types/relationship"

require_relative "../models/unit_response"
require_relative "../errors/unit_error"
require "json"

class ApplicationResource < BaseResource
  include HTTParty
  include HTTMultiParty

  # @param [CreateIndividualApplicationRequest, CreateBusinessApplicationRequest] request
  # @return [UnitResponse, UnitError]
  def create_application(request)
    payload = request.to_json_api
    response = self.class.post("#{api_url}/applications", body: payload, headers: headers)
    case response.code
    when 200...300
      UnitResponse.new(response["data"], response["included"])
    else
      UnitError.from_json_api(response)
    end
  end

  # @param [Integer] application_id
  # @return [UnitResponse, UnitError]
  def get_application(application_id)
    response = self.class.get("#{api_url}/applications/#{application_id}", headers: headers)
    case response.code
    when 200...300
      UnitResponse.new(response["data"], response["included"])
    else
      UnitError.from_json_api(response)
    end
  end

  # @param [ListApplicationParams] params
  # @return [UnitResponse, UnitError]
  def list_applications(params = nil)
    response = self.class.get("#{api_url}/applications", body: params.to_hash.to_json, headers: headers)
    case response.code
    when 200...300
      UnitResponse.new(response["data"], response["included"])
    else
      UnitError.from_json_api(response)
    end
  end

  # @param [UploadDocumentRequest] request
  # @return [UnitResponse, UnitError]
  def upload(request)
    url = "#{api_url}/applications/#{request.application_id}/documents/#{request.document_id}"

    r = request.to_json_api

    headers.merge!({ "Content-Type" => "image/jpeg" }) if request.file_type == "image/jpeg"
    headers.merge!({ "Content-Type" => "image/png" }) if request.file_type == "image/png"
    headers.merge!({ "Content-Type" => "application/pdf" }) if request.file_type == "application/pdf"
    puts headers
    response = self.class.put(url, query: r, headers: headers)

    case response.code
    when 200...300
      UnitResponse.new(response["data"], nil)
    else
      UnitError.from_json_api(response)
    end
  end

  # @param [PatchApplicationRequest] request
  # @return [UnitResponse, UnitError]
  def update(request)
    payload = request.to_json_api
    response = self.class.patch("#{api_url}/applications/#{request.application_id}", body: payload, headers: headers)
    case response.code
    when 200...300
      UnitResponse.new(DtoDecoder.decode(response["data"]), nil)
    else
      UnitError.from_json_api(response)
    end
  end
end
