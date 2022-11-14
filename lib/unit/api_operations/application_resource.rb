# frozen_string_literal: true

require "sorbet-runtime"
require_relative "../api_operations/base_resource"
require_relative "../api_operations/create_individual_application_request"
require_relative "../types/full_name"
require_relative "../types/address"
require_relative "../types/phone"
require_relative "../types/relationship"

require_relative "individual_application_dto"
require_relative "../errors/unit_error"
require "json"

require "httparty"

class ApplicationResource < BaseResource
  include HTTParty
  extend T::Sig

  sig do
    params(request: CreateIndividualApplicationRequest).returns(T.any(IndividualApplicationDto, UnitError))
  end
  def create_application(request)
    payload = request.to_json_api

    response = self.class.post("#{api_url}/applications", body: payload, headers: headers)
    if response.code == 201
      IndividualApplicationDto.from_json_api(response)
    else
      UnitError.from_json_api(response)
    end
  end

  sig do
    params(application_id: Integer).returns(T.any(IndividualApplicationDto, UnitError))
  end
  def get_application(application_id)
    response = self.class.get("#{api_url}/applications/#{application_id}", headers: headers)
    case response.code
    when 200...300
      IndividualApplicationDto.from_json_api(response)
    else
      UnitError.from_json_api(response)
    end
  end
end
