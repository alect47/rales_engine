require 'rails_helper'

describe "Invoice Items relationship API" do
  it "can find invoice associated with item" do
    merchant = create(:merchant)
    item = create(:item, merchant: merchant)
    customer = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer)
    invoice_item_1 = create(:invoice_item, item: item, invoice: invoice_1)
    invoice_item_2 = create(:invoice_item, item: item, invoice: invoice_1)
    get "/api/v1/invoice_items/#{invoice_item_1.id}/invoice"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)
    expect(invoice["data"]["attributes"]["id"]).to eq(invoice_1.id)
  end

end
