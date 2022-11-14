class CreateBusinessApplicationRequest
  attr_reader :name, :address, :phone, :state_of_incorporation, :ein, :contact, :officer, :beneficial_owners,
              :entity_type, :dba, :ip, :website

  extend T::Sig

  sig do
    params(name: String, address: Address, phone: Phone, state_of_incorporation: String,
           contact:).void
  end
  def initialize(ssn, full_name, date_of_birth, address, email, phone, ip = nil, ein = nil, dba = nil, sole_proprietorship = nil, passport = nil,
                 nationality = nil, device_fingerprints = nil, idempotency_key = nil, tags = nil, jwt_object = nil)
    @ssn = ssn
    @full_name = full_name
    @date_of_birth = date_of_birth
    @address = address
    @phone = phone
    @email = email
    @ip = ip
    @ein = ein
    @dba = dba
    @sole_proprietorship = sole_proprietorship
    @passport = passport
    @nationality = nationality
    @device_fingerprints = device_fingerprints
    @idempotency_key = idempotency_key
    @tags = tags
    @jwt_object = jwt_object
    @type = "individualApplication"
  end

  def to_json_api
    {
      "data": {
        "type": type,
        "attributes": {
          "ssn": ssn,
          "fullName": full_name.represent,
          "dateOfBirth": date_of_birth,
          "address": address.represent,
          "email": email,
          "phone": phone.represent
        }
      }
    }.to_json
  end
end

