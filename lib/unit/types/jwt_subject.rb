# frozen_string_literal: true

require "sorbet-runtime"

module Unit
  module Types
    class JwtSubject
      extend T::Sig

      sig do
        params(scope: String,
               jwt_token: String).void
      end
      def initialize(scope, jwt_token = "applications-write")
        @scope = scope
        @jwt_token = jwt_token
      end
    end
  end
end
