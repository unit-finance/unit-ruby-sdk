# frozen_string_literal: true

require_relative "./spec_helper"

RSpec.describe Unit::RecurringPayment do
  before do
    configure_tests
  end

  describe "create book payment" do
    let(:counterparty_id) do
      Unit::Counterparty.create_counterparty(customer_id: "823139", name: "Jo Joel", routing_number: "812345678",
                                             account_number: "1000000001", account_type: "Checking", type: "Business").data["id"]
    end
    let(:create_credit_ach_payment) do
      described_class.create_recurring_credit_ach_payment(account_id: "27573", counterparty_id: counterparty_id, amount: 1000, description: "test payme",
                                                          schedule: SCHEDULE)
    end

    it "should create a credit ach payment" do
      expect(create_credit_ach_payment.data["type"]).to eq("recurringCreditAchPayment")
    end

    it "should create a debit ach payment" do
      response = described_class.create_recurring_debit_ach_payment(account_id: "27573", counterparty_id: counterparty_id, amount: 1000, description: "test payme",
                                                                    schedule: SCHEDULE)
      expect(response.data["type"]).to eq("recurringDebitAchPayment")
    end

    it "should create a credit book payment" do
      response = described_class.create_recurring_credit_book_payment(account_id: "27573", counterparty_id: "36099", amount: 1000, description: "test payme",
                                                                      schedule: SCHEDULE)
      expect(response.data["type"]).to eq("recurringCreditBookPayment")
    end

    it "disables a recurring payment" do
      response = described_class.disable_recurring_payment(recurring_payment_id: "1234")
      expect(response.data["type"]).to eq("recurringCreditAchPayment")
    end

    it "enables a recurring payment" do
      response = described_class.enable_recurring_payment(recurring_payment_id: "1234")
      expect(response.data["type"]).to eq("recurringCreditAchPayment")
    end

    it "lists recurring payments" do
      response = described_class.list_recurring_payment(account_id: "27573")
      expect(response.data[0]["type"]).to eq "recurringCreditAchPayment"
    end

    it "gets a recurring payment" do
      response = described_class.get_recurring_payment(recurring_payment_id: "1234")
      expect(response.data["type"]).to eq "recurringCreditAchPayment"
    end
  end
end
