# frozen_string_literal: true

module Unit
  module CashDeposit
    CASH_DEPOSIT_LIMIT = 100
    CASH_DEPOSIT_OFFSET = 0

    autoload :GenerateBarcodeRequest, "unit/models/cash_deposit/generate_barcode_request"
    autoload :ListByCoordinatesParams, "unit/models/cash_deposit/list_by_coordinates_params"
    autoload :ListByPostalCodeParams, "unit/models/cash_deposit/list_by_postal_code_params"

    class << self
      # Generate a barcode for cash deposit
      # @see https://unit.co/docs/api/payments/cash-deposits/#post-cash-deposit-generate-barcode
      # @param store_id [String]
      # @param account_id [String]
      # @param customer_id [String]
      def generate_barcode(store_id:, account_id:, customer_id:)
        request = GenerateBarcodeRequest.new(store_id, account_id, customer_id)
        Unit::Resource::CashDepositResource.generate_barcode(request)
      end

      # List cash deposit store locations by coordinates
      # @see https://unit.co/docs/api/payments/cash-deposits/#list-cash-deposit-store-locations-by-coordinates
      # @param coordinates [Coordinates]
      # @param limit [Integer] - optional
      # @param offset [Integer] - optional
      # @param service_type [String] - optional
      def list_by_coordinates(coordinates:, limit: CASH_DEPOSIT_LIMIT, offset: CASH_DEPOSIT_OFFSET, service_type: nil)
        request = ListByCoordinatesParams.new(coordinates, limit, offset, service_type)
        Unit::Resource::CashDepositResource.list_by_coordinates(request)
      end

      # List cash deposit store locations by postal code
      # @see https://unit.co/docs/api/payments/cash-deposits/#list-cash-deposit-store-locations-by-postal-code
      # @param postal_code [String]
      # @param limit [Integer] - optional
      # @param offset [Integer] - optional
      # @param service_type [String] - optional
      def list_by_postal_code(postal_code:, limit: CASH_DEPOSIT_LIMIT, offset: CASH_DEPOSIT_OFFSET, service_type: nil)
        request = ListByPostalCodeParams.new(postal_code, limit, offset, service_type)
        Unit::Resource::CashDepositResource.list_by_postal_code(request)
      end

      # Get image by barcode number
      # @see https://unit.co/docs/api/payments/cash-deposits/#get-barcode-image-by-barcode-number
      # @param barcode_number [String]
      def get_image_by_barcode_number(barcode_number:)
        Unit::Resource::CashDepositResource.get_image_by_barcode_number(barcode_number)
      end
    end
  end
end
