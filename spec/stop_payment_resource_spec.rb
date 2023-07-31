# frozen_string_literal: true

require_relative "./spec_helper"

RSpec.describe Unit::StopPayment do
  before do
    configure_tests
  end

  describe "stop payments" do
    def generate_check_number
      format("%06d", rand(1..999_999))
    end

    let(:stop_payment) do
      Unit::StopPayment.create_stop_payment(
        account_id: "1602063",
        amount: 10_345,
        check_number: generate_check_number,
        tags: { "test": "122" }
      ).freeze
    end

    it "should create a stop payment" do
      expect(stop_payment.data["type"]).to eq("stopPayment")
    end

    it "should get a stop payment by id" do
      response = Unit::StopPayment.get_payment(payment_id: "16")
      expect(response.data["type"]).to eq("stopPayment")
    end

    it "should list stop payments" do
      response = Unit::StopPayment.list_stop_payment
      expect(response.data[0]["type"]).to eq("stopPayment")
    end
  end
end
