# frozen_string_literal: true

module Unit
  module Statement
    STATEMENT_LIST_LIMIT = 100
    STATEMENT_LIST_OFFSET = 0
    autoload :ListStatementParams, "unit/models/statement/list_statement_params"
    autoload :GetPdfByIdRequest, "unit/models/statement/get_pdf_by_id_request"
    autoload :GetHtmlByIdRequest, "unit/models/statement/get_html_by_id_request"
    autoload :GetBankVerificationPdf, "unit/models/statement/get_bank_verification_pdf"

    class << self
      # List statements
      # @see https://docs.unit.co/statements#list-statements
      # @param limit [Integer]
      # @param offset [Integer]
      # @param account_id [String]
      # @param customer_id [String]
      # @param period [String]
      # @param sort [String]
      def list_statements(limit: STATEMENT_LIST_LIMIT, offset: STATEMENT_LIST_OFFSET,
                          account_id: nil, customer_id: nil, period: nil, sort: nil)
        params = ListStatementParams.new(limit, offset, account_id, customer_id, period, sort)
        Unit::Resource::StatementResource.list(params)
      end

      # Get statement pdf by id
      # @see https://docs.unit.co/statements#get-statement-pdf
      # @param customer_id [String]
      # @param language [String]
      def get_pdf_by_id(statement_id:, customer_id:, language: nil)
        request = GetPdfByIdRequest.new(statement_id, customer_id, language)
        Unit::Resource::StatementResource.get_pdf_by_id(request)
      end

      # Get statement html by id
      # @see https://docs.unit.co/statements#get-statement-html
      # @param customer_id [String]
      # @param language [String]
      def get_html_by_id(statement_id:, customer_id:, language: nil)
        request = GetHtmlByIdRequest.new(statement_id, customer_id, language)
        Unit::Resource::StatementResource.get_html_by_id(request)
      end

      # Get a bank verification pdf
      # @see https://docs.unit.co/statements#get-bank-verification-pdf
      # @param account_id [String]
      # @param include_proof_of_funds [Boolean]
      def get_bank_verification_pdf(account_id:, include_proof_of_funds: false)
        request = GetBankVerificationPdf.new(account_id, include_proof_of_funds)
        Unit::Resource::StatementResource.get_bank_verification(request)
      end
    end
  end
end
