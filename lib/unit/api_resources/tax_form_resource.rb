# frozen_string_literal: true

require_relative "./base_resource"
require_relative "../utils/http_helper"
require "json"

# class for creating requests for statements to Unit API and parsing responses
# @see https://unit.co/docs/api/tax-forms/
module Unit
  module Resource
    class TaxFormResource < Unit::Resource::BaseResource
      class << self
        # Get tax_forms by calling Unit's API
        # @param params [ListTaxFormParams]
        # @return [UnitResponse, UnitError]
        def list(params = nil)
          response = HttpHelper.get("#{api_url}/tax-forms", params: params&.to_hash, headers: headers)
          response_handler(response)
        end

        # Get a tax form by id by calling Unit's API
        # @param tax_form_id [String]
        # @return [UnitResponse, UnitError]
        def get_tax_form_by_id(tax_form_id)
          response = HttpHelper.get("#{api_url}/tax-forms/#{tax_form_id}", headers: headers)
          response_handler(response)
        end

        # Get a tax form pdf by id by calling Unit's API
        # @param tax_form_id [String]
        # @return [UnitResponse, UnitError]
        def get_tax_form_pdf_by_id(tax_form_id)
          response = HttpHelper.get("#{api_url}/tax-forms/#{tax_form_id}/pdf", headers: headers)
          file_response_handler(response)
        end
      end
    end
  end
end
