# frozen_string_literal: true

require_relative "./spec_helper"

RSpec.describe Unit::AuthorizationRequest do
  before do
    configure_tests
  end

  it "should get authorization request" do
    response = described_class.get_authorization_request(authorization_request_id: "3722")
    expect(response.data["type"]).to eq("purchaseAuthorizationRequest")
  end

  it "should list authorization requests" do
    response = described_class.list_authorization_requests
    expect(response.data[0]["type"]).to eq("purchaseAuthorizationRequest")
  end
end
