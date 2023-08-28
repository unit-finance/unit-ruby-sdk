# frozen_string_literal: true

require_relative "./spec_helper"

RSpec.describe Unit::CheckPayment do
  before do
    configure_tests
  end

  describe "check payments" do
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
  end
end
