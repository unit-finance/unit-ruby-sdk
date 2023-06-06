# frozen_string_literal: true

require_relative "./spec_helper"

RSpec.describe Unit::Repayment do
  before do
    configure_tests
  end

  describe "create ach repayment" do
    it "creates ach repayment" do
      response = described_class.create_ach_repayment(account_id: "27573", credit_account_id: "956423", counterparty_id: "396872", description: "test", amount: 1, addenda: "test", tags: { purpose: "test" },
                                                      same_day: false, idempotency_key: "test")
      expect(response.data["type"]).to eq "achRepayment"
    end

    it "creates book repayment" do
      response = described_class.create_book_repayment(account_id: "27573", credit_account_id: "956423", counterparty_account_id: "36981", description: "test", amount: 1, transaction_summary_override: "override", tags: { purpose: "test" }, idempotency_key: "3a1a33be-4e12-4603-9ed0-820922389fb8")
      expect(response.data["type"]).to eq "bookRepayment"
    end

    it "gets a repayment" do
      response = described_class.get_repayment(repayment_id: "607")
      expect(response.data["type"]).to eq "achRepayment"
    end

    it "lists repayments" do
      response = described_class.list_repayments(limit: 100, offset: 0, status: %w[Sent])
      expect(response.data[0]["type"]).to eq "bookRepayment"
    end
  end
end
