# frozen_string_literal: true

# Update individual customer information request
class PatchIndividualCustomerRequest
  attr_reader :customer_id, :address, :phone, :email, :dba, :authorized_users, :tags, :jwt_subject

  # @param customer_id [String] The id of individual customer
  # @param optional address [Address] The address of individual customer
  # @param optional phone [Phone] The phone of individual customer
  # @param optional email [String] The email of individual customer
  # @param optional dba [String] The dba of individual customer. If the individual is a sole proprietor who is doing business under a different name.
  # @param optional authorized_users [Array<AuthorizedUser>] The authorized users of individual customer
  # @param optional tags [Hash] Provides opportunity to add, update or delete tags from resources with the tags attribute on the corresponding Update operation
  # @param optional jwt_subject [String] The subject of the JWT
  # More information regarding JWTSubject: https://docs.unit.co/customer-api-tokens/#customers-create-customer-bearer-token-jwt
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
