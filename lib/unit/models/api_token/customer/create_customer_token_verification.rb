# frozen_string_literal: true

# Request to create a customer token verification
# @see https://docs.unit.co/customer-api-tokens#customers-customer-token-verification
module Unit
  module ApiToken
    module Customer
      class CreateCustomerTokenVerification
        attr_reader :customer_id, :channel, :phone, :app_hash, :language

        # @param customer_id [String]
        # @param channel [String]
        # @param phone [Phone] - optional
        # @param app_hash [String] - optional
        # @param language [String] - optional
        def initialize(customer_id, channel, phone = nil, app_hash = nil, language = nil)
          @customer_id = customer_id
          @channel = channel
          @phone = phone
          @app_hash = app_hash
          @language = language
        end

        def to_json_api
          result = { data: { type: "customerTokenVerification",
                             attributes:
                               { channel: channel,
                                 phone: phone&.represent,
                                 appHash: app_hash,
                                 language: language } } }
          result[:data][:attributes].compact!
          result.to_json
        end
      end
    end
  end
end
