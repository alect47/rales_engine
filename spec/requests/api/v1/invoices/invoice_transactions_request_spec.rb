require 'rails_helper'

describe "Invoice transactions API" do
  it "sends list of transactions associated with invoice" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer)
    invoice_1_id = invoice_1.id
    transaction_1 = create(:transaction, invoice: invoice_1)
    transaction_2 = create(:transaction, invoice: invoice_1)
    get "/api/v1/invoices/#{invoice_1_id}/transactions"

    expect(response).to be_successful

    transactions = JSON.parse(response.body)
    expect(transactions["data"].count).to eq(2)
  end
end
