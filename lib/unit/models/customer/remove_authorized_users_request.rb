# frozen_string_literal: true

# Request to remove authorized users from customer
# See: https://docs.unit.co/customers#remove-authorized-users
module Unit
  module Customer
    class RemoveAuthorizedUsersRequest
      attr_reader :customer_id, :authorized_users_emails

      # @param customer_id [String]
      # @param authorized_users_emails [Array<String>]
      def initialize(customer_id, authorized_users_emails)
        @customer_id = customer_id
        @authorized_users_emails = authorized_users_emails
      end

      def to_json_api
        payload = {
          data: {
            type: "removeAuthorizedUsers",
            attributes: {
              authorizedUsersEmails: authorized_users_emails
            }
          }
        }
        payload[:data][:attributes].compact!
        payload.to_json
      end
    end
  end
end
