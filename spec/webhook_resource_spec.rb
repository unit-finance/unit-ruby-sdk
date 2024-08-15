# frozen_string_literal: true

require_relative "./spec_helper"

RSpec.describe Unit::Webhook do
  before do
    configure_tests
  end

  it "creates a webhook" do
    response = described_class.create_webhook(label: "some label", url: "https://webhook.site/81ee6b53-fde4-4b7d-85a0-0b6249a4488d",
                                              token: "MyToken", content_type: "Json", delivery_mode: "AtLeastOnce",
                                              include_resources: false, subscription_type: "OnlyAuthorizationRequest")
    expect(response.data["type"]).to eq("webhook")
  end

  it "lists webhooks" do
    response = described_class.list_webhooks
    expect(response.data[0]["type"]).to eq("webhook")
  end

  it "updates a webhook" do
    response = described_class.update_webhook(webhook_id: "10916", label: "updated webhook", url: "https://webhook.site/81ee6b53-fde4-4b7d-85a0-0b6249a4488d",
                                              content_type: "Json", token: "myT")
    expect(response.data["type"]).to eq("webhook")
  end

  it "gets a webhook" do
    response = described_class.get_webhook(webhook_id: "10916")
    expect(response.data["type"]).to eq("webhook")
  end

  it "enables a webhook" do
    response = described_class.enable_webhook(webhook_id: "10916")
    expect(response.data["type"]).to eq("webhook")
  end

  it "disables a webhook" do
    response = described_class.disable_webhook(webhook_id: "10916")
    expect(response.data["type"]).to eq("webhook")
  end
end
