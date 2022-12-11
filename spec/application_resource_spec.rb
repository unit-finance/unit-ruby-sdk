# frozen_string_literal: true

require_relative 'spec_helper'

RSpec.describe Unit::ApplicationResource do
  it "Can create new instance" do
    api_url = "https://testApi.com/"
    token = "testToken"
    application_resource = described_class.new(api_url, token)
    expect(application_resource).not_to be nil
  end
end
