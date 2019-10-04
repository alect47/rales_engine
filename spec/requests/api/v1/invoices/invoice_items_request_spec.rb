require 'rails_helper'

describe "Invoice invoice_items API" do
  it "sends list of invoice_items associated with invoice" do
    merchant = create(:merchant)
    item = create(:item, merchant: merchant)
    customer = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer)
    invoice_1_id = invoice_1.id
    transaction_1 = create(:transaction, invoice: invoice_1)
    transaction_2 = create(:transaction, invoice: invoice_1)
    invoice_item_1 = create(:invoice_item, item: item, invoice: invoice_1)

    get "/api/v1/invoices/#{invoice_1_id}/invoice_items"

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)
    expect(invoice_items["data"].count).to eq(1)
  end

  it "sends list of items associated with invoice" do
    merchant = create(:merchant)
    item = create(:item, merchant: merchant)
    customer = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer)
    invoice_1_id = invoice_1.id
    transaction_1 = create(:transaction, invoice: invoice_1)
    transaction_2 = create(:transaction, invoice: invoice_1)
    invoice_item_1 = create(:invoice_item, item: item, invoice: invoice_1)

    get "/api/v1/invoices/#{invoice_1_id}/items"

    expect(response).to be_successful

    items = JSON.parse(response.body)
    expect(items["data"].count).to eq(1)
  end
end
