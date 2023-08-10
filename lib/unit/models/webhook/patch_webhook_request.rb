# frozen_string_literal: true

# Request to patch webhook
# @see https://docs.unit.co/webhooks#update-webhook
module Unit
  module Webhook
    class PatchWebhookRequest
      attr_reader :webhook_id, :label, :url, :token, :content_type, :token, :include_resources, :subscription_type

      # @param webhook_id [String]
      # @param label [String]
      # @param url [String]
      # @param content_type [String]
      # @param token [String]
      # @param include_resources [Boolean] - optional
      # @param subscription_type [String] - optional
      def initialize(webhook_id, label, url, content_type, token,
                     include_resources = nil, subscription_type = nil)
        @webhook_id = webhook_id
        @label = label
        @url = url
        @token = token
        @content_type = content_type
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
              contentType: content_type,
              token: token,
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
