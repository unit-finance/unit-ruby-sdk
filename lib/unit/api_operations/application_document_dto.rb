# frozen_string_literal: true

require "sorbet-runtime"

class ApplicationDocumentDto
  extend T::Sig

  sig do
    params(id: String, status: String, document_type: String,
           description: T.nilable(String), name: String, address: T.nilable(Address), date_of_birth: T.nilable(String),
           passport: T.nilable(String), ein: T.nilable(String),
           reason_code: T.nilable(String), reason: T.nilable(String)).void
  end
  def initialize(id, status, document_type, description, name, address, date_of_birth, passport,
                 ein, reason_code, reason)
    @id = id
    @type = "document"
    @attributes = { "status": status, "documentType": document_type, "description": description, "name": name,
                    "address": address, "dateOfBirth": date_of_birth, "passport": passport, "ein": ein,
                    "reasonCode": reason_code, "reason": reason }
  end

  def self.from_json_api(id, _type, attributes)
    address = Address.from_json_api(attributes["address"]) if attributes["address"]
    ApplicationDocumentDto.new(id, attributes["status"], attributes["documentType"], attributes["description"], attributes["name"],
                               address, attributes["dateOfBirth"], attributes["passport"],
                               attributes["ein"], attributes["reasonCode"], attributes["reason"])
  end
end
