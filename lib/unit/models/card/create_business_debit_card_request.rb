# frozen_string_literal: true

# Request to create business debit card request
# @see https://docs.unit.co/cards#create-business-debit-card
module Unit
  module Card
    class CreateBusinessDebitCardRequest
      attr_reader :account_id, :full_name, :date_of_birth, :address, :shipping_address, :phone, :email, :design, :additional_embossed_text,
                  :idempotency_key, :tags, :limits, :print_only_business_name, :expiry_date, :type

      # @param account_id [String]
      # @param full_name [FullName]
      # @param date_of_birth [Date]
      # @param address [Address]
      # @param shipping_address [Address] - optional
      # @param phone [Phone] - optional
      # @param email [String] - optional
      # @param design [String] - optional
      # @param additional_embossed_text [String] - optional
      # @param idempotency_key [String] - optional
      # @param tags [Hash] - optional
      # @param limits [Hash] - optional
      # @param print_only_business_name [Boolean] - optional
      # @param expiry_date [String] - optional
      def initialize(account_id, full_name, date_of_birth, address, shipping_address = nil, phone = nil, email = nil, design = nil,
                     additional_embossed_text = nil, idempotency_key = nil, tags = nil, limits = nil, print_only_business_name = nil, expiry_date = nil)
        @account_id = account_id
        @full_name = full_name
        @date_of_birth = date_of_birth
        @address = address
        @shipping_address = shipping_address
        @phone = phone
        @email = email
        @design = design
        @additional_embossed_text = additional_embossed_text
        @idempotency_key = idempotency_key
        @tags = tags
        @limits = limits
        @print_only_business_name = print_only_business_name
        @expiry_date = expiry_date
        @type = "businessDebitCard"
      end

      def to_json_api
        payload = {
          "data": {
            "type": type,
            "attributes": {
              "fullName": full_name&.represent,
              "dateOfBirth": date_of_birth,
              "address": address&.represent,
              "shippingAddress": shipping_address,
              "phone": phone&.represent,
              "email": email,
              "design": design,
              "additionalEmbossedText": additional_embossed_text,
              "idempotencyKey": idempotency_key,
              "tags": tags,
              "limits": limits,
              "printOnlyBusinessName": print_only_business_name,
              "expiryDate": expiry_date
            }.compact!,
            "relationships": {
              "account": Unit::Types::Relationship.new("account", account_id).to_hash
            }
          }
        }
        payload.to_json
      end
    end
  end
end
