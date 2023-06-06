# frozen_string_literal: true

# Request to create webhook
# @see https://docs.unit.co/webhooks#create-webhook
module Unit
  module Webhook
    class CreateWebhookRequest
      attr_accessor :label, :url, :token, :content_type, :delivery_mode,
                    :include_resources, :subscription_type

      # @param label [String]
      # @param url [String]
      # @param token [String]
      # @param content_type [String]
      # @param delivery_mode [String]
      # @param include_resources [Boolean] - optional
      # @param subscription_type [String] - optional
      def initialize(label, url, token, content_type, delivery_mode,
                     include_resources = nil, subscription_type = nil)
        @label = label
        @url = url
        @token = token
        @content_type = content_type
        @delivery_mode = delivery_mode
        @include_resources = include_resources
        @subscription_type = subscription_type
      end

      def to_json_api
        payload = {
          data: {
            type: "webhook",
            attributes: {
              label: label,
              url: url,
              token: token,
              contentType: content_type,
              deliveryMode: delivery_mode,
              includeResources: include_resources,
              subscriptionType: subscription_type
            }
          }
        }
        payload[:data][:attributes].compact!
        payload.to_json
      end
    end
  end
end
