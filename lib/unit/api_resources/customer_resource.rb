# frozen_string_literal: true

require_relative "../api_resources/base_resource"
require_relative "../models/unit_response"
require_relative "../errors/unit_error"
require_relative "../utils/http_helper"

# class for creating requests for customers to Unit API and parsing responses
# @see https://docs.unit.co/customers/
module Unit
  module Resource
    class CustomerResource < Unit::Resource::BaseResource
      class << self
        # Update a customer by calling Unit's API
        # @param [PatchIndividualCustomerRequest, PatchBusinessCustomerRequest, PatchTrustCustomerRequest] request
        # @return [UnitResponse, UnitError]
        def update(request)
          payload = request.to_json_api
          response = HttpHelper.patch("#{api_url}/customers/#{request.customer_id}", body: payload, headers: headers)
          response_handler(response)
        end

        # Get a customer by calling Unit's API
        # @param [String] customer_id
        # @return [UnitResponse, UnitError]
        def get(customer_id)
          response = HttpHelper.get("#{api_url}/customers/#{customer_id}", headers: headers)
          response_handler(response)
        end

        # Get customers by calling Unit's API
        # @param [ListCustomerParams] params
        # @return [UnitResponse, UnitError]
        def list(params = nil)
          p params
          response = HttpHelper.get("#{api_url}/customers", params: params.to_hash, headers: headers)
          response_handler(response)
        end

        # Archive customers by calling Unit's API
        # @param [ArchiveCustomerRequest] request
        # @return [UnitResponse, UnitError]
        def archive(request)
          payload = request.to_json_api
          response = HttpHelper.post("#{api_url}/customers/#{request.customer_id}/archive", body: payload, headers: headers)
          response_handler(response)
        end

        # Add authorized users to a customer by calling Unit's API
        # @param [AddAuthorizedUsersRequest] request
        # @return [UnitResponse, UnitError]
        def add_authorized_users(request)
          payload = request.to_json_api
          response = HttpHelper.post(
            "#{api_url}/customers/#{request.customer_id}/authorized-users",
            body: payload,
            headers: headers
          )
          response_handler(response)
        end

        # Remove authorized users from a customer by calling Unit's API
        # @param [RemoveAuthorizedUsersRequest] request
        # @return [UnitResponse, UnitError]
        def remove_authorized_users(request)
          payload = request.to_json_api
          response = HttpHelper.delete("#{api_url}/customers/#{request.customer_id}/authorized-users", body: payload, headers: headers)
          response_handler(response)
        end
      end
    end
  end
end
