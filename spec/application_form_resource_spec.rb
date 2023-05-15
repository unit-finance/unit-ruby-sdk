# frozen_string_literal: true

require "date"
require_relative "./spec_helper"

RSpec.describe Unit::ApplicationForm do
  before do
    configure_tests
  end

  describe "application forms" do
    let(:application_form) do
      described_class.create_application_form(
        tags: { "tag1" => "value1", "tag2" => "value2" },
        applicant_details: APPLICATION_FORM_PREFILL,
        allowed_application_types: %w[Business], lang: "en",
        settings_override: SETTINGS_OVERRIDE,
        require_id_verification: REQUIRE_ID_VERIFICATION,
        hide_application_progress_tracker: false
      )
    end

    it "creates application form" do
      expect(application_form.data["type"]).to eq("applicationForm")
    end

    it "gets application form" do
      response = described_class.get_application_form(application_form.data["id"])
      expect(response.data["type"]).to eq("applicationForm")
    end

    it "lists application forms" do
      response = described_class.list_application_forms(limit: 20, offset: 10)
      expect(response.data[0]["type"]).to eq("applicationForm")
    end
  end
end
