# frozen_string_literal: true

# Update business customer information request
# @see https://docs.unit.co/customers#update-business-customer
module Unit
  module Customer
    class PatchBusinessCustomerRequest
      attr_reader :customer_id, :address, :phone, :contact, :authorized_users, :dba, :tags

      # @param customer_id [String]
      # @param address [Address] - optional
      # @param phone [Phone] - optional
      # @param contact [BusinessContact] - optional
      # @param authorized_users [Array<AuthorizedUser>] - optional
      # @param dba [String] - optional
      # @param tags [Hash] - optional
      # more information regarding tags: https://docs.unit.co/#updating-tags
      def initialize(customer_id, address = nil, phone = nil, contact = nil,
                     authorized_users = nil, dba = nil, tags = nil)
        @customer_id = customer_id
        @address = address
        @phone = phone
        @contact = contact
        @authorized_users = authorized_users
        @dba = dba
        @tags = tags
      end

      def to_json_api
        payload = {
          data: {
            type: "businessCustomer",
            attributes: {
              address: address&.represent,
              phone: phone&.represent,
              contact: contact&.represent,
              authorizedUsers: authorized_users&.map(&:represent),
              dba: dba,
              tags: tags
            }
          }
        }
        payload[:data][:attributes].compact!
        payload.to_json
      end
    end
  end
end
