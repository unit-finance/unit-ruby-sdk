# frozen_string_literal: true

# Request to create Customer token using JWT
# @see https://docs.unit.co/customer-api-tokens#customers-create-customer-bearer-token-jwt
module Unit
  module ApiToken
    module Customer
      class CreateTokenUsingJwtRequest
        attr_reader :customer_id, :scope, :jwt_token

        # @param scope [String]
        # @param jwt_token [String]
        def initialize(customer_id, scope, jwt_token = nil)
          @customer_id = customer_id
          @scope = scope
          @jwt_token = jwt_token
        end

        def to_json_api
          result = { data: { type: "customerToken",
                             attributes:
                               { scope: scope,
                                 jwtToken: jwt_token } } }
          result[:data][:attributes].compact!
          result.to_json
        end
      end
    end
  end
end
