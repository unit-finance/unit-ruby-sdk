# frozen_string_literal: true

module Unit
  module TaxForm
    TAX_FORM_LIMIT = 100
    TAX_FORM_OFFSET = 0
    autoload :ListTaxFormParams, "unit/models/tax_form/list_tax_form_params"

    class << self
      # List tax forms
      # @see https://unit.co/docs/api/tax-forms/#list-tax-forms
      # @param limit [Integer]
      # @param offset [Integer]
      # @param account_id [String]
      # @param customer_id [String]
      # @param tax_years [String]
      # @param tax_form_types [String]
      def list_tax_forms(limit: TAX_FORM_LIMIT, offset: TAX_FORM_OFFSET,
                         account_id: nil, customer_id: nil, tax_years: nil, tax_form_types: nil)
        params = ListTaxFormParams.new(limit, offset, account_id, customer_id, tax_years, tax_form_types)
        Unit::Resource::TaxFormResource.list(params)
      end

      # Get tax form by id
      # @see https://unit.co/docs/api/tax-forms/#get-tax-form
      # @param tax_form_id [String]
      def get_by_id(tax_form_id:)
        Unit::Resource::TaxFormResource.get_tax_form_by_id(tax_form_id)
      end

      # Get tax form pdf by id
      # @see https://unit.co/docs/api/tax-forms/#get-tax-form-pdf
      # @param tax_form_id [String]
      def get_pdf_by_id(tax_form_id:)
        Unit::Resource::TaxFormResource.get_tax_form_pdf_by_id(tax_form_id)
      end
    end
  end
end
