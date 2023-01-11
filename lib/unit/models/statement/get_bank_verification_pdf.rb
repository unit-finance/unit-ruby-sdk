# frozen_string_literal: true

# Request to get bank verification pdf
# @see https://docs.unit.co/statements#get-bank-verification-pdf
module Unit
  module Statement
    class GetBankVerificationPdf
      attr_accessor :account_id, :include_proof_of_funds

      # @param account_id [String]
      # @param include_proof_of_funds [Boolean]
      def initialize(account_id, include_proof_of_funds: false)
        @account_id = account_id
        @include_proof_of_funds = include_proof_of_funds
      end

      def to_hash
        params = { "includeProofOfFunds": include_proof_of_funds }
        params.compact
      end
    end
  end
end
