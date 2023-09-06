# frozen_string_literal: true

require_relative "./spec_helper"

RSpec.describe Unit::Event do
  before do
    configure_tests
  end

  describe "event requests" do
    it "gets an event" do
      response = described_class.get_event(event_id: "15543784")
      expect(response.data["type"]).to eq("transaction.created")
    end

    it "lists events" do
      response = described_class.list_events
      expect(response.data[0]["type"]).to be_truthy
    end

    it "fires an event" do
      response = described_class.fire_event(event_id: "15543784")
      expect(response.data).to be_nil
    end
  end
end
