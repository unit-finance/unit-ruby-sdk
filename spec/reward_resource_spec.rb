# frozen_string_literal: true

require_relative "./spec_helper"

RSpec.describe Unit::Reward do
  before do
    configure_tests
  end

  describe "reward requests" do
    it "creates reward request" do
      response = described_class.create_reward(receiving_account_id: "46457", amount: 4000, description: "test", tags: { purpose: "test" }, idempotency_key: "1324234")
      expect(response.data["type"]).to eq("reward")
    end

    it "gets a reward request" do
      response = described_class.get_reward(reward_id: "7262")
      expect(response.data["type"]).to eq("reward")
    end

    it "lists reward requests" do
      response = described_class.list_rewards
      expect(response.data[0]["type"]).to eq("reward")
    end
  end
end
