# frozen_string_literal: true

# Request to get pdf by id
# @see https://docs.unit.co/statements#get-statement-pdf
module Unit
  module Statement
    class GetPdfByIdRequest
      attr_accessor :statement_id, :customer_id, :language

      # @param statement_id [String]
      # @param customer_id [String]
      # @param language [String]
      def initialize(statement_id, customer_id, language = nil)
        @statement_id = statement_id
        @customer_id = customer_id
        @language = language
      end

      def to_hash
        params = { "filter[customerId]": customer_id,
                   "language": language }
        params.compact
      end
    end
  end
end
