# frozen_string_literal: true

module Unit
  module Webhook
    class << self
      WEBHOOK_LIMIT = 100
      WEBHOOK_OFFSET = 0
      autoload :CreateWebhookRequest, "unit/models/webhook/create_webhook_request"
      autoload :ListWebhookParams, "unit/models/webhook/list_webhook_params"
      autoload :PatchWebhookRequest, "unit/models/webhook/patch_webhook_request"

      # Create a webhook
      # @see https://docs.unit.co/webhooks#create-webhook
      # @param label [String]
      # @param url [String]
      # @param token [String]
      # @param content_type [String]
      # @param delivery_mode [String]
      # @param include_resources [Boolean] - optional
      # @param subscription_type [String] - optional
      def create_webhook(label:, url:, token:, content_type:, delivery_mode:,
                         include_resources: nil, subscription_type: nil)
        request = CreateWebhookRequest.new(label, url, token, content_type, delivery_mode,
                                           include_resources, subscription_type)
        Unit::Resource::WebhookResource.create_webhook(request)
      end

      # Request to list webhooks
      # @see https://docs.unit.co/webhooks#list-webhooks
      # @param limit [Integer]
      # @param offset [Integer]
      # @param since [String] - optional
      # @param until_ [String] - optional
      # @param from_id [Integer] - optional
      # @param told [Integer] - optional
      def list_webhooks(limit: WEBHOOK_LIMIT, offset: WEBHOOK_OFFSET, since: nil,
                        until_: nil, from_id: nil, told: nil)
        request = ListWebhookParams.new(limit, offset, since, until_, from_id, told)
        Unit::Resource::WebhookResource.list_webhooks(request)
      end

      # Request to patch webhook
      # @see https://docs.unit.co/webhooks#update-webhook
      # @param webhook_id [String]
      # @param label [String]
      # @param url [String]
      # @param content_type [String]
      # @param token [String]
      # @param include_resources [Boolean] - optional
      # @param subscription_type [String] - optional
      def update_webhook(webhook_id:, label:, url:, content_type:, token:,
                         include_resources: nil, subscription_type: nil)
        request = PatchWebhookRequest.new(webhook_id, label, url, content_type, token,
                                          include_resources, subscription_type)
        Unit::Resource::WebhookResource.update_webhook(request)
      end

      # Request to get a webhook
      # @see https://docs.unit.co/webhooks#get-webhook
      # @param webhook_id [String]
      def get_webhook(webhook_id:)
        Unit::Resource::WebhookResource.get_webhook(webhook_id)
      end

      # Request to enable a webhook
      # @see https://docs.unit.co/webhooks#enable
      # @param webhook_id [String]
      def enable_webhook(webhook_id:)
        Unit::Resource::WebhookResource.enable_webhook(webhook_id)
      end

      # Request to disable a webhook
      # @see https://docs.unit.co/webhooks#disable
      # @param webhook_id [String]
      def disable_webhook(webhook_id:)
        Unit::Resource::WebhookResource.disable_webhook(webhook_id)
      end
    end
  end
end
