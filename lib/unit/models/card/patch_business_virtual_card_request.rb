# frozen_string_literal: true

# Request to update a business virtual debit card
# @see https://docs.unit.co/cards/#update-business-virtual-debit-card
module Unit
  module Card
    class PatchBusinessVirtualCardRequest
      attr_reader :card_id, :address, :phone, :email, :tags, :limits, :type

      # @param card_id [String]
      # @param address [Address] - optional
      # @param phone [Phone] - optional
      # @param email [String] - optional
      # @param tags [Hash] - optional
      # @param limits [Hash] - optional
      def initialize(card_id, address = nil, phone = nil, email = nil, tags = nil, limits = nil)
        @card_id = card_id
        @address = address
        @phone = phone
        @email = email
        @tags = tags
        @limits = limits
        @type = "businessVirtualDebitCard"
      end

      def to_json_api
        payload = {
          "data": {
            "type": type,
            "attributes": {
              "address": address,
              "phone": phone,
              "email": email,
              "tags": tags,
              "limits": limits
            }
          }
        }
        payload[:data][:attributes].compact!
        payload.to_json
      end
    end
  end
end
