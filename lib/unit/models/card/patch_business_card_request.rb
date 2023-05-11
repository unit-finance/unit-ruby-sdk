# frozen_string_literal: true

# Request to create business card request
# @see https://docs.unit.co/cards/#update-business-debit-card
module Unit
  module Card
    class PatchBusinessCardRequest
      attr_reader :card_id, :shipping_address, :address, :phone, :email, :design, :tags, :limits, :type

      # @param card_id [String]
      # @param shipping_address [Address] - optional
      # @param address [Address] - optional
      # @param phone [Phone] - optional
      # @param email [String] - optional
      # @param design [String] - optional
      # @param tags [Hash] - optional
      # @param limits [Hash] - optional
      def initialize(card_id, shipping_address = nil, address = nil, phone = nil, email = nil, design = nil, tags = nil, limits = nil)
        @card_id = card_id
        @shipping_address = shipping_address
        @address = address
        @phone = phone
        @email = email
        @design = design
        @tags = tags
        @limits = limits
        @type = "businessDebitCard"
      end

      def to_json_api
        payload = {
          "data": {
            "type": type,
            "attributes": {
              "shippingAddress": shipping_address,
              "address": address,
              "phone": phone,
              "email": email,
              "design": design,
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
