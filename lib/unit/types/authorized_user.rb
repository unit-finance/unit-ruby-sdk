# frozen_string_literal: true

# Type representing authorized user
# See: https://docs.unit.co/customers/#authorized-users
class AuthorizedUser
  attr_reader :full_name, :email, :phone, :jwt_subject

  # @param full_name [FullName] The full name of the authorized user
  # @param email [String] The email of the authorized user
  # @param phone [Phone] The phone of the authorized user
  # @param optional jwt_subject [String] The JWT subject of the authorized user. See https://docs.unit.co/customer-api-tokens/#customers-create-customer-bearer-token-jwt
  def initialize(full_name, email, phone, jwt_subject = nil)
    @full_name = full_name
    @email = email
    @phone = phone
    @jwt_subject = jwt_subject
  end

  def represent
    payload = {
      fullName: full_name.represent,
      email: email,
      phone: phone.represent,
      jwtSubject: jwt_subject
    }
    payload.compact
  end
end
