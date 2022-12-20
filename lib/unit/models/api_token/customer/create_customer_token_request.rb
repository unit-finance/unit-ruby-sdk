# frozen_string_literal: true

# Request to create a customer token
# @see https://docs.unit.co/customer-api-tokens#customers-create-customer-bearer-token
module Unit
  module ApiToken
    module Customer
      class CreateCustomerTokenRequest
        attr_reader :customer_id, :scope, :verification_token, :verification_code, :expires_in, :resources

        # @param customer_id [String]
        # @param scope [Array<String>]
        # @param verification_token [String] - optional
        # @param verification_code [String] - optional
        # @param expires_in [Integer] - optional
        # @param resources [Array<RestrictedResource>] - optional
        def initialize(customer_id, scope, verification_token, verification_code = nil,
                       expires_in = nil, resources = nil)
          @customer_id = customer_id
          @scope = scope
          @verification_token = verification_token
          @verification_code = verification_code
          @expires_in = expires_in
          @resources = resources
        end

        def to_json_api
          result = { data: { type: "customerToken",
                             attributes:
                               { scope: scope&.join(" "),
                                 verificationToken: verification_token,
                                 verificationCode: verification_code,
                                 expiresIn: expires_in,
                                 resources: resources } } }
          result[:data][:attributes].compact!
          result.to_json
        end
      end
    end
  end
end
