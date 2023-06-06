# frozen_string_literal: true

require_relative "./base_resource"
require_relative "../utils/http_helper"
require "json"

# class for creating requests for webhooks
# @see https://docs.unit.co/webhooks/#webhook
module Unit
  module Resource
    class WebhookResource < Unit::Resource::BaseResource
      class << self
        # Create a webhook by calling Unit's API
        # @param request [CreateWebhookRequest]
        # @return [UnitResponse, UnitError]
        def create_webhook(request)
          payload = request.to_json_api
          response = HttpHelper.post("#{api_url}/webhooks", body: payload, headers: headers)
          response_handler(response)
        end

        # Get a webhook by calling Unit's API
        # @param webhook_id [String]
        # @return [UnitResponse, UnitError]
        def get_webhook(webhook_id)
          response = HttpHelper.get("#{api_url}/webhooks/#{webhook_id}", headers: headers)
          response_handler(response)
        end

        # List webhooks by calling Unit's API
        # @param params [ListWebhookParams]
        # @return [UnitResponse, UnitError]
        def list_webhooks(params = nil)
          response = HttpHelper.get("#{api_url}/webhooks", params: params.to_hash, headers: headers)
          response_handler(response)
        end

        # Update a webhook by calling Unit's API
        # @param request [PatchWebhookRequest]
        # @return [UnitResponse, UnitError]
        def update_webhook(request)
          payload = request.to_json_api
          response = HttpHelper.patch("#{api_url}/webhooks/#{request.webhook_id}", body: payload, headers: headers)
          response_handler(response)
        end

        # Enable a webhook by calling Unit's API
        # @param webhook_id [String]
        # @return [UnitResponse, UnitError]
        def enable_webhook(webhook_id)
          response = HttpHelper.post("#{api_url}/webhooks/#{webhook_id}/enable", headers: headers)
          response_handler(response)
        end

        # Disable a webhook by calling Unit's API
        # @param webhook_id [String]
        # @return [UnitResponse, UnitError]
        def disable_webhook(webhook_id)
          response = HttpHelper.post("#{api_url}/webhooks/#{webhook_id}/disable", headers: headers)
          response_handler(response)
        end
      end
    end
  end
end
