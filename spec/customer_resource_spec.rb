# frozen_string_literal: true

require_relative "spec_helper"

RSpec.describe Unit::CustomerResource do
  it "Can create new instance" do
    application_resource = described_class.new("", "")
    expect(application_resource).not_to be nil
  end
end
