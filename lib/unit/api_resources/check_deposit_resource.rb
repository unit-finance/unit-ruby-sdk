# frozen_string_literal: true

require_relative "./base_resource"
require_relative "../utils/http_helper"
require "json"
# class for creating requests for check deposits to Unit API and parsing responses
# @see https://docs.unit.co/check-deposits
module Unit
  module Resource
    class CheckDepositResource < Unit::Resource::BaseResource
      class << self
        # Create a check deposit by calling Unit's API
        # @param request [CreateCheckDepositRequest]
        # @return [UnitResponse, UnitError]
        def create_deposit(request)
          payload = request.to_json_api
          response = HttpHelper.post("#{api_url}/check-deposits", body: payload, headers: headers)
          response_handler(response)
        end

        # Get a check deposit by id by calling Unit's API
        # @param params [GetRequest]
        # @return [UnitResponse, UnitError]
        def get(params)
          payload = params.to_hash
          response = HttpHelper.get("#{api_url}/check-deposits/#{params.deposit_id}", params: payload, headers: headers)
          response_handler(response)
        end

        # Get a list of check deposits by calling Unit's API
        # @param params [ListDepositRequest]
        # @return [UnitResponse, UnitError]
        def list(params = nil)
          response = HttpHelper.get("#{api_url}/check-deposits", params: params.to_hash, headers: headers)
          response_handler(response)
        end

        # Update a check deposit by id by calling Unit's API
        # @param request [PatchCheckDepositRequest]
        # @return [UnitResponse, UnitError]
        def update(request)
          payload = request.to_json_api
          response = HttpHelper.patch("#{api_url}/check-deposits/#{request.deposit_id}", body: payload, headers: headers)
          response_handler(response)
        end

        # Upload a check deposit image by calling Unit's API
        # @param request [UploadImageRequest]
        # @return [UnitResponse, UnitError]
        def upload(request)
          side = request.is_front_side ? "/front" : "/back"

          headers_updated = headers

          headers_updated["Content-Type"] = "image/jpeg"

          response = HttpHelper.put("#{api_url}/check-deposits/#{request.deposit_id}#{side}", body: request.file_content, headers: headers_updated)

          response_handler(response)
        end

        # Get a check deposit image by calling Unit's API
        # @param request [GetImageRequest]
        # @return [UnitResponse, UnitError]
        def get_image(request)
          side = request.is_front_side ? "front" : "back"
          response = HttpHelper.get("#{api_url}/check-deposits/#{request.deposit_id}/#{side}", headers: headers, response_type: "image")
          file_response_handler(response)
        end

        # Confirm a check deposit by calling Unit's API
        # @param deposit_id [String]
        # @return [UnitResponse, UnitError]
        def confirm_details(deposit_id)
          response = HttpHelper.post("#{api_url}/check-deposits/#{deposit_id}/confirm", headers: headers)
          response_handler(response)
        end
      end
    end
  end
end
