require 'rails_helper'

describe "Items API" do
  it "sends list of items" do
    merchant = create(:merchant)
    item_1 = create(:item, merchant: merchant)
    item_2 = create(:item, merchant: merchant)
    get '/api/v1/items'

    expect(response).to be_successful

    items = JSON.parse(response.body)
    expect(items["data"].count).to eq(2)
  end

  it "can get one item by id" do
    merchant = create(:merchant)
    item_1 = create(:item, merchant: merchant)
    id = item_1.id
    get "/api/v1/items/#{id}"

    item = JSON.parse(response.body)

    expect(response).to be_successful
    expect(item["data"]["id"].to_i).to eq(id)
  end
end
