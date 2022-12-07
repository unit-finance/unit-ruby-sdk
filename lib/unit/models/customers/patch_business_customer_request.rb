# frozen_string_literal: true

# Update business customer information request
# See: https://docs.unit.co/customers#update-business-customer
class PatchBusinessCustomerRequest
  attr_reader :customer_id, :address, :phone, :contact, :authorized_users, :dba, :tags

  # @param customer_id [String] The id of business
  # @param optional address [Address] The address of business
  # @param optional phone [Phone] The phone of business
  # @param optional contact [BusinessContact] The primary contact of the business
  # @param optional authorized_users [Array<AuthorizedUser>] The authorized users of business
  # @param optional dba [String] The dba of business. To modify or add needed to specify the new dba name.
  # @param optional tags [Hash] Provides opportunity to add, update or delete tags from resources with the tags attribute on the corresponding Update operation
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
          authorized_users: authorized_users&.map(&:represent),
          dba: dba,
          tags: tags
        }
      }
    }
    payload[:data][:attributes].compact!
    payload.to_json
  end
end
