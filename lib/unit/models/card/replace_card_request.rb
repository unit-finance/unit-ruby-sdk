# frozen_string_literal: true

# Request to replace a card
# @see https://docs.unit.co/cards#replace-card
module Unit
  module Card
    class ReplaceCardRequest
      attr_reader :card_id, :shipping_address

      # @param card_id [String]
      # @param shipping_address [Address] - optional
      def initialize(card_id, shipping_address = nil)
        @card_id = card_id
        @shipping_address = shipping_address
      end

      def to_json_api
        payload = {
          "data": {
            "type": "replaceCard",
            "attributes": {
              "shippingAddress": shipping_address&.represent
            }
          }
        }
        payload[:data][:attributes].compact!
        payload.to_json
      end
    end
  end
end
