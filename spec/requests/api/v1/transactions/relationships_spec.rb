require 'rails_helper'

describe "Transactions invoice API" do
  it "sends associated invoice" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer)
    transaction_1 = create(:transaction, invoice: invoice_1)
    transaction_2 = create(:transaction, invoice: invoice_1)
    get "/api/v1/transactions/#{transaction_1.id}/invoice"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)
    expect(invoice["data"]["attributes"]["id"]).to eq(invoice_1.id)
  end
end
