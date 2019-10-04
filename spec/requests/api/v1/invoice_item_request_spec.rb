require 'rails_helper'

describe "Invoice Items API" do
  it "sends list of invoice_items" do
    merchant = create(:merchant)
    item = create(:item, merchant: merchant)
    customer = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer)
    invoice_item_1 = create(:invoice_item, item: item, invoice: invoice_1)
    invoice_item_2 = create(:invoice_item, item: item, invoice: invoice_1)
    get '/api/v1/invoice_items'

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)
    expect(invoice_items["data"].count).to eq(2)
  end

  it "can get one invoice_item by id" do
    merchant = create(:merchant)
    item = create(:item, merchant: merchant)
    customer = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer)
    invoice_item_1 = create(:invoice_item, item: item, invoice: invoice_1)
    id = invoice_item_1.id
    get "/api/v1/invoice_items/#{id}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice_item["data"]["id"].to_i).to eq(id)
  end
end
