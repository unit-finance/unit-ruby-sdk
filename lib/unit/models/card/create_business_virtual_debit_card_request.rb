# frozen_string_literal: true

# Request to create a business virtual debit card
# @see https://docs.unit.co/cards#create-business-virtual-debit-card
module Unit
  module Card
    class CreateBusinessVirtualDebitCardRequest
      attr_reader :account_id, :full_name, :date_of_birth, :address, :phone, :email, :idempotency_key, :tags, :limits

      # @param account_id [String]
      # @param full_name [FullName]
      # @param date_of_birth [Date]
      # @param address [Address]
      # @param phone [Phone] - optional
      # @param email [String] - optional
      # @param idempotency_key [String] - optional
      # @param tags [Hash] - optional
      # @param limits [Hash] - optional
      def initialize(account_id, full_name, date_of_birth, address, phone, email,
                     idempotency_key, tags, limits)
        @account_id = account_id
        @full_name = full_name
        @date_of_birth = date_of_birth
        @address = address
        @phone = phone
        @email = email
        @idempotency_key = idempotency_key
        @tags = tags
        @limits = limits
      end

      def to_json_api
        payload = {
          "data": {
            "type": "businessVirtualDebitCard",
            "attributes": {
              "fullName": full_name&.represent,
              "dateOfBirth": date_of_birth,
              "address": address&.represent,
              "phone": phone&.represent,
              "email": email,
              "idempotencyKey": idempotency_key,
              "tags": tags,
              "limits": limits
            },
            "relationships": {
              "account": Unit::Types::Relationship.new("depositAccount", account_id).to_hash
            }
          }
        }
        payload[:data][:attributes].compact!
        payload.to_json
      end
    end
  end
end
