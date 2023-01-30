# frozen_string_literal: true

require_relative "./spec_helper"

RSpec.describe Unit::CheckDeposit do
  before do
    configure_tests
  end

  describe " deposits" do
    let(:account_id) { Unit::Account::Deposit.create_deposit_account(deposit_product: "checking", tags: { "purpose": "checking" }, relationships: RELATIONSHIPS).data["id"] }
    let(:check_deposit) { Unit::CheckDeposit.create_deposit(account_id: account_id, amount: 50_000, description: "test check deposit") }

    it "should create a check deposit" do
      expect(check_deposit.data["type"]).to eq("checkDeposit")
    end

    it "should get a check deposit" do
      response = Unit::CheckDeposit.get_deposit(deposit_id: "16558", include: %w[customer account transaction])
      expect(response.data["type"]).to eq("checkDeposit")
    end

    it "should list check deposits" do
      response = Unit::CheckDeposit.list_deposit(limit: 10, offset: 0, account_id: "27573")
      expect(response.data[0]["type"]).to eq("checkDeposit")
    end

    it "should update the deposit" do
      response = Unit::CheckDeposit.update_deposit(deposit_id: "16558", tags: { "status": "Awaiting Customer Confirmation", "id": "23033b64-38f8-4dbc-91a1-313ff0156d02" })
      expect(response.data["type"]).to eq("checkDeposit")
    end

    it "uploads image front" do
      response = Unit::CheckDeposit.upload_image_front(deposit_id: check_deposit.data["id"], file_content: get_image_contents)
      expect(response.data["type"]).to eq("checkDeposit")
    end

    it "uploads image back" do
      response = Unit::CheckDeposit.upload_image_back(deposit_id: "16559", file_content: get_image_contents, is_front_side: false)
      expect(response.data["type"]).to eq("checkDeposit")
    end

    it "gets image front" do
      response = Unit::CheckDeposit.get_image_front(deposit_id: "16549")
      expect(response).to be_truthy
    end

    it "gets image back" do
      response = Unit::CheckDeposit.get_image_front(deposit_id: "16552", is_front_side: false)
      expect(response).to be_truthy
    end
  end
end
