# frozen_string_literal: true

# Update individual customer information request
# @see: https://docs.unit.co/customers#update-individual-customer
module Unit
  module Customer
    class PatchIndividualCustomerRequest
      attr_reader :customer_id, :address, :phone, :email, :dba, :authorized_users, :tags, :jwt_subject

      # @param customer_id [String]
      # @param address [Address] - optional
      # @param phone [Phone] - optional
      # @param email [String] - optional
      # @param dba [String] - optional
      # @param authorized_users [Array<AuthorizedUser>] - optional
      # @param tags [Hash] - optional
      # @param jwt_subject [String] - optional
      def initialize(customer_id, address = nil, phone = nil, email = nil, dba = nil, authorized_users = nil, tags = nil, jwt_subject = nil)
        @customer_id = customer_id
        @address = address
        @phone = phone
        @email = email
        @dba = dba
        @authorized_users = authorized_users
        @tags = tags
        @jwt_subject = jwt_subject
      end

      def to_json_api
        payload = {
          data: {
            type: "individualCustomer",
            attributes: {
              address: address&.represent,
              phone: phone&.represent,
              email: email,
              dba: dba,
              authorized_users: authorized_users&.map(&:represent),
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
