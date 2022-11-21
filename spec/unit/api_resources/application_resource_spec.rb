require 'rspec'
require 'spec_helper'
require 'faker'
require 'factory_bot'
require 'unit'
require 'unit/api_resources/application_resource'
require 'unit/models/create_individual_application_request'
require 'unit/models/create_business_application_request'
require 'unit/models/patch_application_request'
require 'unit/models/list_application_params'
require 'unit/types/full_name'

describe 'ApplicationResource' do
  subject { ApplicationResource.new(api_url, token) }

  let(:api_url) { 'https://api.s.unit.sh' }
  let(:token) { "v2.public.eyJyb2xlIjoiYWRtaW4iLCJ1c2VySWQiOiI0MTQ4Iiwic3ViIjoic29sb21paWFAY29kaWZ5LmlvIiwiZXhwIjoiMjAyMy0xMC0yNlQwOTowMTozMC4zMzZaIiwianRpIjoiMTkxNDAzIiwib3JnSWQiOiIxMjYiLCJzY29wZSI6ImFwcGxpY2F0aW9ucyBhcHBsaWNhdGlvbnMtd3JpdGUgY3VzdG9tZXJzIGN1c3RvbWVycy13cml0ZSBjdXN0b21lci10YWdzLXdyaXRlIGN1c3RvbWVyLXRva2VuLXdyaXRlIGFjY291bnRzIGFjY291bnRzLXdyaXRlIGNhcmRzIGNhcmRzLXdyaXRlIGNhcmRzLXNlbnNpdGl2ZSBjYXJkcy1zZW5zaXRpdmUtd3JpdGUgdHJhbnNhY3Rpb25zIHRyYW5zYWN0aW9ucy13cml0ZSBhdXRob3JpemF0aW9ucyBzdGF0ZW1lbnRzIHBheW1lbnRzIHBheW1lbnRzLXdyaXRlIHBheW1lbnRzLXdyaXRlLWNvdW50ZXJwYXJ0eSBwYXltZW50cy13cml0ZS1hY2gtZGViaXQgY291bnRlcnBhcnRpZXMgY291bnRlcnBhcnRpZXMtd3JpdGUgYmF0Y2gtcmVsZWFzZXMgYmF0Y2gtcmVsZWFzZXMtd3JpdGUgd2ViaG9va3Mgd2ViaG9va3Mtd3JpdGUgZXZlbnRzIGV2ZW50cy13cml0ZSBhdXRob3JpemF0aW9uLXJlcXVlc3RzIGF1dGhvcml6YXRpb24tcmVxdWVzdHMtd3JpdGUgY2hlY2stZGVwb3NpdHMgY2hlY2stZGVwb3NpdHMtd3JpdGUgcmVjZWl2ZWQtcGF5bWVudHMgcmVjZWl2ZWQtcGF5bWVudHMtd3JpdGUgZGlzcHV0ZXMgY2hhcmdlYmFja3MgY2hhcmdlYmFja3Mtd3JpdGUgcmV3YXJkcyByZXdhcmRzLXdyaXRlIiwib3JnIjoiU0RLIiwic291cmNlSXAiOiIiLCJ1c2VyVHlwZSI6Im9yZyIsImlzVW5pdFBpbG90IjpmYWxzZX2qHkf2pANz0QGpF7VGPrFdStkwEGGKGuqhUaQuGqKKPXxcceLJkL2cTLZVEmq0j70XbZDIkQ4ANjj-xuPGveMG" }
  let(:full_name) { FullName.new("Peter", "Parker") }
  let(:address) { Address.new("20 Ingram St", "Forest Hills", "NY", "12333", "US" ) }
  let(:phone) { Phone.new("380", "567893") }
  let(:ssn) { '123456789' }
  let(:date_of_birth) { Faker::Date.birthday(min_age: 18, max_age: 65) }
  let(:email) { Faker::Internet.email }
  let(:payload) {
    { data: {"type": "individualApplication",
             "id": "820038",
             "attributes":
                           {"createdAt": "2022-11-21T11:20:31.581Z",
                            "fullName": {"first":"Peter", "last":"parker"},
                            "ssn": "123456789",
                            "address":
                                     {"street": "20 Ingram St",
                                      "city": "Forest Hills",
                                      "state": "NY",
                                      "postalCode": "12333",
                                      "country": "US"},
                            "dateOfBirth": "1995-03-22",
                            "email": "bob_hartmann@rutherford.biz",
                            "phone": {"countryCode":"380", "number":"567893"},
                            "status": "AwaitingDocuments",
                            "message": "Waiting for you to upload the required documents.",
                            "evaluationId": "S-9uJRcwtIfd2OKfBiIpcC",
                            "soleProprietorship": false,
                            "tags": {},
                            "archived": false},
             "relationships":
                           {"org": {"data":{"type":"org", "id":"126"}},
                            "documents":
                                     {"data":
                                                 [{"type":"document", "id":"120758"},
                                                  {"type":"document", "id":"120759"}]}}},
      "included": [{"id": "120758",
        "type": "document",
        "attributes":
                {"documentType": "IdDocument",
                 "status": "Required",
                 "description":
                           "Please provide a copy of your unexpired government issued photo ID which would include Drivers License or State ID.",
                 "ssn": "123456789",
                 "name": "Peter parker",
                 "dateOfBirth": "1995-03-22"}},
       {"id": "120759",
        "type": "document",
        "attributes":
                {"documentType": "AddressVerification",
                 "status": "Required",
                 "description":
                           "Please provide a document to verify your address. Document may be a utility bill, bank statement, lease agreement or current pay stub.",
                 "name": "Peter parker",
                 "address":
                           {"street": "20 Ingram St",
                            "city": "Forest Hills",
                            "state": "NY",
                            "postalCode": "12333",
                            "country": "US"}
                } }] } }


  describe '#create_application' do
    let(:request) { CreateIndividualApplicationRequest.new(ssn, full_name, date_of_birth, address, email, phone) }
     let(:data) { JSON.parse(payload.to_json) }
    let(:unit_response) { UnitResponse.new( data['data'], data['included'] ) }

    it 'makes a post request to the applications endpoint' do
      expect(subject.create_application(request)).to eq(unit_response)
    end
  end
end
