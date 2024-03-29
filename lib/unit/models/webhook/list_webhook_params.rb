# frozen_string_literal: true

# Request to list webhooks
# @see https://docs.unit.co/webhooks#list-webhooks
module Unit
  module Webhook
    class ListWebhookParams
      attr_accessor :limit, :offset, :since, :until_, :from_id, :told

      # @param limit [Integer]
      # @param offset [Integer]
      # @param since [String] - optional
      # @param until_ [String] - optional
      # @param from_id [Integer] - optional
      # @param told [Integer] - optional
      def initialize(limit = WEBHOOK_LIMIT, offset = WEBHOOK_OFFSET, since = nil,
                     until_ = nil, from_id = nil, told = nil)
        @limit = limit
        @offset = offset
        @since = since
        @until_ = until_
        @from_id = from_id
        @told = told
      end

      def to_hash
        payload = {
          "page[limit]": limit,
          "page[offset]": offset,
          "filter[since]": since,
          "filter[until]": until_,
          "filter[fromId]": from_id,
          "filter[told]": told
        }
        payload.compact!
      end
    end
  end
end
