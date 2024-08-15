# frozen_string_literal: true

require_relative "./spec_helper"

RSpec.describe Unit::CashDeposit do
  before do
    configure_tests
  end

  describe "cash deposits" do
    let(:account_id) { Unit::Account::Deposit.create_deposit_account(deposit_product: "checking", tags: { "purpose": "checking" }, relationships: RELATIONSHIPS).data["id"] }
    let(:customer_id) { "751009" } # use an appropriate customer id
    let(:barcode_number) { "830324007490008112328976855334" } # use an appropriate barcode number
    let(:coordinates) { Unit::Types::Coordinates.new(40.730610, -71.935242) }

    it "should generate a barcode for cash deposit" do
      store_id = "2481"
      response = Unit::CashDeposit.generate_barcode(store_id: store_id, account_id: account_id, customer_id: customer_id)
      expect(response.data["type"]).to eq("cashDepositBarcode")
    end

    it "should list cash deposit store locations by coordinates" do
      response = Unit::CashDeposit.list_by_coordinates(coordinates: coordinates, service_type: "Barcode")
      expect(response.data.first["type"]).to eq("storeLocation")
    end

    it "should list cash deposit store locations by postal code" do
      postal_code = "11937"
      response = Unit::CashDeposit.list_by_postal_code(postal_code: postal_code, service_type: "Barcode")
      expect(response.data.first["type"]).to eq("storeLocation")
    end

    it "should get cash deposit image by barcode number" do
      response = Unit::CashDeposit.get_image_by_barcode_number(barcode_number: barcode_number)
      expect(response).to be_truthy
    end
  end
end
