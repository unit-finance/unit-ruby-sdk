# frozen_string_literal: true

require_relative "./base_resource"
require_relative "../utils/http_helper"
require "json"
# class for creating requests for statements to Unit API and parsing responses
# @see https://docs.unit.co/cards
module Unit
  module Resource
    class StatementResource < Unit::Resource::BaseResource
      class << self
        # Get statements by calling Unit's API
        # @param params [ListStatementParams]
        # @return [UnitResponse, UnitError]
        def list(params = nil)
          response = HttpHelper.get("#{api_url}/statements", params: params&.to_hash, headers: headers)
          response_handler(response)
        end

        # Get a html statement by id by calling Unit's API
        # @param params [GetHtmlByIdRequest]
        # @return [UnitResponse, UnitError]
        def get_html_by_id(request)
          response = HttpHelper.get("#{api_url}/statements/#{request.statement_id}/html", params: request.to_hash, headers: headers)
          file_response_handler(response)
        end

        # Get a pdf statement by id by calling Unit's API
        # @param request [GetPdfByIdRequest]
        # @return [UnitResponse, UnitError]
        def get_pdf_by_id(request)
          response = HttpHelper.get("#{api_url}/statements/#{request.statement_id}/pdf", params: request.to_hash, headers: headers)
          file_response_handler(response)
        end

        # Get bank verification by calling Unit's API
        # @param request [GetBankVerificationRequest]
        # @return [UnitResponse, UnitError]
        def get_bank_verification(request)
          response = HttpHelper.get("#{api_url}/statements/#{request.account_id}/bank/pdf", params: request&.to_hash, headers: headers)
          file_response_handler(response)
        end
      end
    end
  end
end
