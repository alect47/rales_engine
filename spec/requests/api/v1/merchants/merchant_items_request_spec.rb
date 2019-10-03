require 'rails_helper'

describe "Merchants items API" do
  it "sends list of items associated with merchant" do
    merchant = create(:merchant)
    merchant_id = merchant.id
    item_1 = create(:item, merchant: merchant)
    item_2 = create(:item, merchant: merchant)
    get "/api/v1/merchants/#{merchant_id}/items"

    expect(response).to be_successful

    items = JSON.parse(response.body)
    expect(items["data"].count).to eq(2)
  end

end
