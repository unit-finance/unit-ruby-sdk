# frozen_string_literal: true

# Request to create an org API token
# @see https://docs.unit.co/org-api-tokens#create-org-api-token
module Unit
  module ApiToken
    module Org
      class CreateApiTokenRequest
        attr_reader :user_id, :description, :scope, :expiration, :source_ip, :resources

        # @param user_id [String]
        # @param description [String]
        # @param scope [Array<String>]
        # @param expiration [String]
        # @param source_ip [String] - optional
        # @param resources [Array<RestrictedResource>] - optional
        def initialize(user_id, description, scope, expiration, source_ip = nil, resources = nil)
          @user_id = user_id
          @description = description
          @scope = scope
          @expiration = expiration
          @source_ip = source_ip
          @resources = resources
        end

        def to_json_api
          result = { data: { type: "apiToken",
                             attributes:
                               { description: description,
                                 scope: scope.join(" "),
                                 expiration: expiration,
                                 sourceIp: source_ip,
                                 resources: resources } } }
          result[:data][:attributes].compact!
          result.to_json
        end
      end
    end
  end
end
