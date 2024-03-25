# frozen_string_literal: true

require_relative "./spec_helper"

RSpec.describe Unit::Institution do
  before do
    configure_tests
  end

  it "should get an institution" do
    response = described_class.get_institution(routing_number: "053285241")
    expect(response.data["type"]).to eq "institution"
  end
end
