# frozen_string_literal: true

require "sorbet-runtime"
require_relative "../api_operations/base_resource"
require_relative "../api_operations/create_individual_application_request"
require_relative "../api_operations/create_business_application_request"
require_relative "../api_operations/patch_application_request"
require_relative "../api_operations/list_application_params"

require_relative "../types/full_name"
require_relative "../types/address"
require_relative "../types/phone"
require_relative "../types/relationship"

require_relative "individual_application_dto"
require_relative "../types/dto_decoder"
require_relative "../unit_response"
require_relative "../errors/unit_error"
require "json"

require "httparty"

class ApplicationResource < BaseResource
  include HTTParty
  extend T::Sig

  sig do
    params(request: T.any(CreateIndividualApplicationRequest, CreateBusinessApplicationRequest)).void
  end
  def create_application(request)
    payload = request.to_json_api
    response = self.class.post("#{api_url}/applications", body: payload, headers: headers)
    case response.code
    when 200...300
      check_application_type(response)
    else
      UnitError.from_json_api(response)
    end
  end

  sig do
    params(application_id: Integer).returns(T.any(UnitResponse, UnitError))
  end
  def get_application(application_id)
    response = self.class.get("#{api_url}/applications/#{application_id}", headers: headers)
    case response.code
    when 200...300
      check_application_type(response)
    else
      UnitError.from_json_api(response)
    end
  end

  sig do
    params(params: ListApplicationParams).returns(T.any(UnitResponse, UnitError))
  end
  def list_applications(params = nil)
    response = self.class.get("#{api_url}/applications", body: params.to_hash.to_json, headers: headers)
    case response.code
    when 200...300
      check_application_type(response)
    else
      UnitError.from_json_api(response)
    end
  end

  def check_application_type(response)
    UnitResponse.new(DtoDecoder.decode(response["data"]), DtoDecoder.decode(response["included"]))
  end

  sig do
    params(request: UploadDocumentRequest).void
  end
  def upload(request)
    url = "#{api_url}/applications/#{request.application_id}/documents/#{request.document_id}"
    url += "/back" if request.is_back_side

    headers = {}

    headers = { "Content-Type" => "image/jpeg" } if request.file_type == "image/jpeg"
    headers = { "Content-Type" => "image/png" } if request.file_type == "image/png"
    headers = { "Content-Type" => "application/pdf" } if request.file_type == "application/pdf"

    response = self.class.put(url, body: request.file, headers: headers)
    case response.code
    when 200...300
      UnitResponse.new(DtoDecoder.decode(response["data"]), nil)
    else
      UnitError.from_json_api(response)
    end
  end

  sig do
    params(request: PatchApplicationRequest).void
  end
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
