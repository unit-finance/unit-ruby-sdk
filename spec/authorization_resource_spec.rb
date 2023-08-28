# frozen_string_literal: true

require "date"
require_relative "./spec_helper"

RSpec.describe Unit::Authorization do
  before do
    configure_tests
  end

  it "should get an authorization" do
    response = described_class.get_authorization(authorization_id: "203794")
    expect(response.data["type"]).to eq("authorization")
  end

  it "should list authorizations" do
    response = described_class.list_authorizations
    expect(response.data[0]["type"]).to eq("authorization")
  end
end
