# frozen_string_literal: true

# Update a trust customer request
# See: https://docs.unit.co/customers#update-trust-customer
class PatchTrustCustomerRequest
  attr_reader :customer_id, :authorized_users, :tags

  # @param customer_id [String] The id of trust customer
  # @param optional authorized_users [Array<AuthorizedUser>] The authorized users of trust customer
  # @param optional tags [Hash] Provides opportunity to add, update or delete tags from resources with the tags attribute on the corresponding Update operation
  # more information regarding tags: https://docs.unit.co/#updating-tags
  def initialize(customer_id, authorized_users = nil, tags = nil)
    @customer_id = customer_id
    @authorized_users = authorized_users
    @tags = tags
  end

  def to_json_api
    payload = {
      data: {
        type: "trustCustomer",
        attributes: {
          authorizedUsers: authorized_users&.map(&:represent),
          tags: tags
        }
      }
    }
    payload[:data][:attributes].compact!
    payload.to_json
  end
end
