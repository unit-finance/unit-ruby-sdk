# frozen_string_literal: true

require_relative "./spec_helper"
require "date"

RSpec.describe Unit::ApiToken::Org do
  before do
    configure_tests
  end

  describe "org token creation" do
    let(:create_response) { described_class.create_api_token(user_id: "252", description: "test token", scope: "customers applications", expiration: "2022-12-21T13:47:17.000Z", source_ip: "192.11.1.1") }
    it "should create an org token" do
      expect(create_response.data["type"]).to eq("apiToken")
    end

    it "lists tokens" do
      response = described_class.list_tokens(user_id: "252")
      response.data.each do |token|
        expect(token["type"]).to be_truthy
      end
    end

    it "should revoke token" do
      response = described_class.revoke_token(user_id: "252", token_id: create_response.data["id"])
      expect(response.data).to be_nil
    end
  end
end

RSpec.describe Unit::ApiToken::Customer do
  before do
    configure_tests
  end
  describe "customer token creation" do
    let(:create_verification) { described_class.create_customer_token_verification(customer_id: "768867", channel: "sms") }

    it "should create a customer token" do
      response = described_class.create_customer_token(customer_id: "768867", scope: %w[customers accounts payments],
                                                       verification_token: create_verification.data["attributes"]["verificationToken"])
      expect(response.data["type"]).to eq("customerBearerToken")
    end

    it "should create customer token verification" do
      expect(create_verification.data["type"]).to eq("customerTokenVerification")
    end

    it "should create a customer token using JWT" do
      response = described_class.create_customer_token_with_jwt(customer_id: "768867", scope: %w[customers accounts payments])
      expect(response.data["type"]).to eq("customerBearerToken")
    end
  end
end
