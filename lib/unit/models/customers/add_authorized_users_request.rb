# frozen_string_literal: true

# Request to add authorized users to a project
# See: https://docs.unit.co/customers#add-authorized-users
class AddAuthorizedUsersRequest
  attr_reader :customer_id, :authorized_users

  # @param customer_id [String] The id of customer
  # @param authorized_users [Array<AuthorizedUser>] The authorized users
  def initialize(customer_id, authorized_users)
    @customer_id = customer_id
    @authorized_users = authorized_users
  end

  def to_json_api
    payload = {
      data: {
        type: "addAuthorizedUsers",
        attributes: {
          authorizedUsers: authorized_users.map(&:represent)
        }
      }
    }
    payload[:data][:attributes].compact!
    payload.to_json
  end
end
