# frozen_string_literal: true

require_relative "./spec_helper"

RSpec.describe Unit::ReceivedPayment do
  before do
    configure_tests
  end

  it "gets received ach payment" do
    response = described_class.get_payment(payment_id: "1232")
    expect(response.data["type"]).to eq("achReceivedPayment")
  end

  it "updates ach received payment" do
    response = described_class.update_payment(payment_id: "1232", tags: { purpose: "test" })
    expect(response.data["type"]).to eq("achReceivedPayment")
  end

  it "lists ach received payments" do
    response = described_class.list_payments(status: %w[Pending])
    expect(response.data[0]["type"]).to eq("achReceivedPayment")
  end
end
