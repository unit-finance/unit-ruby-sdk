# frozen_string_literal: true

require_relative "./spec_helper"

RSpec.describe Unit::AtmLocation do
  before do
    configure_tests
  end

  let(:coordinates) { Unit::Types::Coordinates.new(40.730610, -71.935242) }

  it "should list by coordinates" do
    response = described_class.list_by_coordinates(coordinates: coordinates, search_radius: 30)
    response.data do |atm_location|
      expect(atm_location["type"]).to eq("atmLocation")
    end
  end

  it "should list by postal code" do
    response = described_class.list_by_postal_code(postal_code: "02139", search_radius: 30)
    response.data do |atm_location|
      expect(atm_location["type"]).to eq("atmLocation")
    end
  end

  it "should list by address" do
    response = described_class.list_by_address(address: ADDRESS, search_radius: 30)
    response.data do |atm_location|
      expect(atm_location["type"]).to eq("atmLocation")
    end
  end
end
