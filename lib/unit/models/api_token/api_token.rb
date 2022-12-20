# frozen_string_literal: true

module Unit
  module ApiToken
    module Org
      autoload :CreateApiTokenRequest, "unit/models/api_token/org/create_api_token_request"

      class << self
        # Create a new Org API api_token by calling Unit's API
        # @see https://docs.unit.co/org-api-tokens#create-org-api-token
        # @param user_id [String]
        # @param description [String]
        # @param scope [Array<String>]
        # @param expiration [Datetime]
        # @param source_ip [String] - optional
        # @param resources [Array<RestrictedResource>] - optional
        # @return [UnitResponse, UnitError]
        def create_api_token(user_id:, description:, scope:, expiration:, source_ip: nil, resources: nil)
          request = CreateApiTokenRequest.new(user_id, description, scope, expiration, source_ip, resources)
          Unit::Resource::ApiTokenResource.create_org_api_token(request)
        end

        # Get Org API tokens by calling Unit's API
        # @see https://docs.unit.co/org-api-tokens#list-org-api-tokens
        # @param user_id [String]
        # @return [UnitResponse, UnitError]
        def list_tokens(user_id:)
          Unit::Resource::ApiTokenResource.list_org_tokens(user_id)
        end

        # Revoke Org API api_token by calling Unit's API
        # @see https://docs.unit.co/org-api-tokens#revoke-org-api-token
        # @param user_id [String]
        # @param token_id [String]
        # @return [UnitResponse, UnitError]
        def revoke_token(user_id:, token_id:)
          Unit::Resource::ApiTokenResource.revoke_org_token(user_id, token_id)
        end
      end
    end

    module Customer
      autoload :CreateCustomerTokenRequest, "unit/models/api_token/customer/create_customer_token_request"
      autoload :CreateTokenUsingJwtRequest, "unit/models/api_token/customer/create_token_using_jwt_request"
      autoload :CreateCustomerTokenVerification, "unit/models/api_token/customer/create_customer_token_verification"

      class << self
        # Create customer token by calling Unit's API
        # @see https://docs.unit.co/customer-api-tokens#customers-create-customer-bearer-token
        # @param customer_id [String]
        # @param scope [Array<String>]
        # @param verification_token [String]
        # @param verification_code [String] - optional
        # @param expires_in [Integer] - optional
        # @param resources [Array<RestrictedResource>] - optional
        # @return [UnitResponse, UnitError]
        def create_customer_token(customer_id:, scope:, verification_token:, verification_code: nil, expires_in: nil,
                                  resources: nil)
          request = CreateCustomerTokenRequest.new(customer_id, scope, verification_token, verification_code, expires_in, resources)
          Unit::Resource::ApiTokenResource.create_customer_token(request)
        end

        # Create customer token using JWT by calling Unit's API
        # @see https://docs.unit.co/customer-api-tokens#customers-create-customer-bearer-token-jwt
        # @param customer_id [String]
        # @param scope [Array<String>]
        # @param jwt_token [String] - optional
        # @return [UnitResponse, UnitError]
        def create_customer_token_with_jwt(customer_id:, scope:, jwt_token: nil)
          request = CreateTokenUsingJwtRequest.new(customer_id, scope, jwt_token)
          Unit::Resource::ApiTokenResource.create_customer_token(request)
        end

        # Create customer token verification by calling Unit's API
        # @see https://docs.unit.co/customer-api-tokens#customers-customer-token-verification
        # @param customer_id [String]
        # @param channel [String]
        # @param phone [Phone] - optional
        # @param app_hash [String] - optional
        # @param language [String] - optional
        # @return [UnitResponse, UnitError]
        def create_customer_token_verification(customer_id:, channel:, phone: nil, app_hash: nil, language: nil)
          request = CreateCustomerTokenVerification.new(customer_id, channel, phone, app_hash, language)
          Unit::Resource::ApiTokenResource.create_token_verification(request)
        end
      end
    end
  end
end
