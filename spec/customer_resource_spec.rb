# frozen_string_literal: true

require_relative "./spec_helper"

RSpec.describe Unit::Resource::CustomerResource do
  before do
    configure_tests
  end

  it "Should update individual customer" do
    request = Unit::Customer::PatchIndividualCustomerRequest.new("733576", ADDRESS)
    response = described_class.update(request)
    expect(response.data["type"]).to eq "individualCustomer"
  end

  it "Should update business customer" do
    request = Unit::Customer::PatchBusinessCustomerRequest.new("733565", ADDRESS, PHONE, CONTACT)
    response = described_class.update(request)
    expect(response.data["type"]).to eq "businessCustomer"
  end

  it "Should get individual customer" do
    response = described_class.get("733576")
    expect(response.data["type"]).to eq "individualCustomer"
  end

  it "Should get business customer" do
    response = described_class.get("733565")
    expect(response.data["type"]).to eq "businessCustomer"
  end

  it "Should list customers" do
    request_params = Unit::Customer::ListCustomerParams.new(10, 0, "Richard")
    response = described_class.list(request_params)
    response.data.each do |customer|
      expect(CUSTOMER_TYPES).to include customer["type"]
    end
  end

  it "Should add authorised users" do
    request = Unit::Customer::AddAuthorizedUsersRequest.new("733565", AUTHORIZED_USERS)
    response = described_class.add_authorized_users(request)
    expect(response.data["type"]).to eq "businessCustomer"
  end

  it "Should remove authorised users" do
    request = Unit::Customer::RemoveAuthorizedUsersRequest.new("733565", ["mfg@hotmail.com"])
    response = described_class.remove_authorized_users(request)
    expect(response.data["type"]).to eq "businessCustomer"
    expect(response.data["attributes"]["authorizedUsers"].length).to eq 1
  end
end
