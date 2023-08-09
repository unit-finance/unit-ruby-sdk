# frozen_string_literal: true

# Request to get authorization
# @see https://docs.unit.co/cards-authorizations#get-authorization-by-id
module Unit
  module Authorization
    class GetRequest
      attr_reader :authorization_id, :include_non_authorized

      # @param authorization_id [String]
      # @param include_non_authorized [Boolean]
      def initialize(authorization_id, include_non_authorized = nil)
        @authorization_id = authorization_id
        @include_non_authorized = include_non_authorized
      end

      def to_hash
        { 'filter[includeNonAuthorized]': include_non_authorized }.compact
      end
    end
  end
end
