require 'rails_helper'

describe "Customer relationships API" do
  it "sends list of associated invoices" do
    merchant = create(:merchant)
    customer_1 = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer_1)
    transaction_1 = create(:transaction, invoice: invoice_1)
    transaction_2 = create(:transaction, invoice: invoice_1)
    get "/api/v1/customers/#{customer_1.id}/invoices"

    expect(response).to be_successful

    invoices = JSON.parse(response.body)
    expect(invoices["data"].count).to eq(1)
  end

  it "sends list of associated transactions" do
    merchant = create(:merchant)
    customer_1 = create(:customer)
    customer_2 = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer_1)
    invoice_2 = create(:invoice, merchant: merchant, customer: customer_2)
    transaction_1 = create(:transaction, invoice: invoice_1)
    transaction_2 = create(:transaction, invoice: invoice_2)
    get "/api/v1/customers/#{customer_1.id}/transactions"

    expect(response).to be_successful

    transactions = JSON.parse(response.body)
    expect(transactions["data"].count).to eq(1)
  end

end
