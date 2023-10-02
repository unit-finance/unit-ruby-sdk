# frozen_string_literal: true

require_relative "./spec_helper"

RSpec.describe Unit::CheckPayment do
  before do
    configure_tests
  end

  describe "check payments" do
    it "should originate a check payment" do
      response = Unit::CheckPayment.originate_check_payment(
        account_id: "1862088",
        customer_id: "1270728",
        customer_type: "individualCustomer",
        amount: 100,
        counterparty: CHECK_PAYMENT_COUNTERPARTY,
        description: "test",
        idempotency_key: "test"
      )
      expect(response.data["type"]).to eq("checkPayment")
    end

    it "should get a check payment by id" do
      response = Unit::CheckPayment.get_payment(payment_id: "199")
      expect(response.data["type"]).to eq("checkPayment")
    end

    it "should list check payments" do
      response = Unit::CheckPayment.list_payment
      expect(response.data[0]["type"]).to eq("checkPayment")
    end

    it "gets image front" do
      response = Unit::CheckPayment.get_image(payment_id: "199")
      expect(response).to be_truthy
    end

    it "gets image back" do
      response = Unit::CheckPayment.get_image(payment_id: "199", is_front_side: false)
      expect(response).to be_truthy
    end

    it "cancels a check payment" do
      response = Unit::CheckPayment.cancel_check_payment(payment_id: "539")
      expect(response.data["type"]).to eq("checkPayment")
    end
  end
end
