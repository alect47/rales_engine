require 'rails_helper'

describe "Items relationships API" do
  it "sends list of invoice_items associated with item" do
    merchant = create(:merchant)
    item = create(:item, merchant: merchant)
    customer = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer)
    invoice_item_1 = create(:invoice_item, item: item, invoice: invoice_1)
    invoice_item_2 = create(:invoice_item, item: item, invoice: invoice_1)
    get "/api/v1/items/#{item.id}/invoice_items"

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)
    expect(invoice_items["data"].count).to eq(2)
  end
  it "sends merchant associated with item" do
    merchant_1 = create(:merchant)
    item = create(:item, merchant: merchant_1)
    customer = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant_1, customer: customer)
    invoice_item_1 = create(:invoice_item, item: item, invoice: invoice_1)
    invoice_item_2 = create(:invoice_item, item: item, invoice: invoice_1)
    get "/api/v1/items/#{item.id}/merchant"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)
    expect(merchant["data"]["attributes"]["id"]).to eq(merchant_1.id)
  end

end
