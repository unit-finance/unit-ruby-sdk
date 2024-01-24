# frozen_string_literal: true

require_relative "./base_resource"
require_relative "../utils/http_helper"
require "json"
# class for creating requests for cash deposits to Unit API and parsing responses
# @see https://unit.co/docs/api/payments/cash-deposits/
module Unit
  module Resource
    class CashDepositResource < Unit::Resource::BaseResource
      class << self
        # Generate a barcode for cash deposit
        # @param request [GenerateBarcodeRequest]
        # @return [UnitResponse, UnitError]
        def generate_barcode(request)
          payload = request.to_json_api
          response = HttpHelper.post("#{api_url}/cash-deposits/barcodes", body: payload, headers: headers)
          response_handler(response)
        end

        # List cash deposit store locations by coordinates
        # @param request [ListByCoordinatesParams]
        # @return [UnitResponse, UnitError]
        def list_by_coordinates(params = nil)
          response = HttpHelper.get("#{api_url}/store-locations", params: params&.to_hash, headers: headers)
          response_handler(response)
        end

        # List cash deposit store locations by postal code
        # @param request [ListByPostalCodeParams]
        # @return [UnitResponse, UnitError]
        def list_by_postal_code(params = nil)
          response = HttpHelper.get("#{api_url}/store-locations", params: params.to_hash, headers: headers)
          response_handler(response)
        end

        # Get cash deposit image by barcode number
        # @param barcode_number [String]
        # @return [UnitResponse, UnitError]
        def get_image_by_barcode_number(barcode_number)
          response = HttpHelper.get("#{api_url}/cash-deposits/barcodes/#{barcode_number}/image", headers: headers, response_type: "image")
          file_response_handler(response)
        end
      end
    end
  end
end
