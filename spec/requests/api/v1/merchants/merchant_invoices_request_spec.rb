require 'rails_helper'

describe "Merchant nvoices API" do
  it "sends list of invoices associated with merchant" do
    merchant = create(:merchant)
    merchant_id = merchant.id
    customer = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer)
    invoice_2 = create(:invoice, merchant: merchant, customer: customer)

    get "/api/v1/merchants/#{merchant_id}/invoices"

    expect(response).to be_successful

    invoices = JSON.parse(response.body)
    expect(invoices["data"].count).to eq(2)
  end

end
