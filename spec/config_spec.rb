# frozen_string_literal: true

require_relative "./spec_helper"

RSpec.describe "Unit.config" do
  before do
    configure_tests
  end

  it "Should have api_url" do
    expect(Unit.config[:api_url]).not_to be nil
  end

  it "Should have token" do
    expect(Unit.config[:token]).not_to be nil
  end
end
