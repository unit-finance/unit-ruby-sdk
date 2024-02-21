# frozen_string_literal: true

# Request to list tax forms
# @see https://unit.co/docs/api/tax-forms/#list-tax-forms
module Unit
  module TaxForm
    class ListTaxFormParams
      attr_reader :limit, :offset, :account_id, :customer_id, :tax_years, :tax_form_types

      # @param limit [Integer] - optional
      # @param offset [Integer] - optional
      # @param account_id [String] - optional
      # @param customer_id [String] - optional
      # @param tax_years [String] - optional
      # @param tax_form_types [String] - optional
      def initialize(limit = TAX_FORM_LIMIT, offset = TAX_FORM_OFFSET,
                     account_id = nil, customer_id = nil, tax_years = nil, tax_form_types = nil)
        @limit = limit
        @offset = offset
        @account_id = account_id
        @customer_id = customer_id
        @tax_years = tax_years
        @tax_form_types = tax_form_types
      end

      def to_hash
        params = { "page[limit]": limit,
                   "page[offset]": offset,
                   "filter[accountId]": account_id,
                   "filter[customerId]": customer_id,
                   "filter[taxYears]": tax_years,
                   "filter[taxFormTypes]": tax_form_types }
        params.compact
      end
    end
  end
end
