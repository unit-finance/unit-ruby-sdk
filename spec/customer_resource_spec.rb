# frozen_string_literal: true

require_relative "./spec_helper"

RSpec.describe Unit::Customer do
  before do
    configure_tests
  end

  it "Should update individual customer" do
    response = described_class.update_individual_customer(customer_id: "733576", address: ADDRESS)
    expect(response.data["type"]).to eq "individualCustomer"
  end

  it "Should update business customer" do
    response = described_class.update_business_customer(customer_id: "733565", address: ADDRESS, phone: PHONE, contact: CONTACT)
    expect(response.data["type"]).to eq "businessCustomer"
  end

  it "Should get individual customer" do
    response = described_class.get_customer("733576")
    expect(response.data["type"]).to eq "individualCustomer"
  end

  it "Should get business customer" do
    response = described_class.get_customer("733565")
    expect(response.data["type"]).to eq "businessCustomer"
  end

  it "Should list customers" do
    response = described_class.list_customers(limit: 20, offset: 10)
    response.data.each do |customer|
      expect(CUSTOMER_TYPES).to include customer["type"]
    end
  end

  it "Should add authorised users" do
    response = described_class.add_authorized_users(customer_id: "733565", authorized_users: AUTHORIZED_USERS)
    expect(response.data["type"]).to eq "businessCustomer"
  end

  it "Should remove authorised users" do
    response = described_class.remove_authorized_users(customer_id: "733565", authorized_users: ["april.doe@unit-finance.com"])
    expect(response.data["type"]).to eq "businessCustomer"
    expect(response.data["attributes"]["authorizedUsers"].length).to eq 3
  end
end
