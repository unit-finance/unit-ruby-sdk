# frozen_string_literal: true

# Type representing require id verification
# @see https://docs.unit.co/types#require-id-verification
module Unit
  module Types
    class RequireIdVerification
      attr_reader :individual, :officer, :beneficial_owners

      # @param individual [Boolean] - optional
      # @param officer [Boolean] - optional
      # @param beneficial_owners [Boolean] - optional
      def initialize(individual = nil, officer = nil, beneficial_owners = nil)
        @individual = individual
        @officer = officer
        @beneficial_owners = beneficial_owners
      end

      def represent
        payload = {
          individual: individual,
          officer: officer,
          beneficialOwners: beneficial_owners
        }
        payload.compact
      end
    end
  end
end
