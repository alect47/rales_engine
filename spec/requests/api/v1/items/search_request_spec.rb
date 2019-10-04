require 'rails_helper'

describe "Items search API" do
  it "can find first item by id" do
    merchant = create(:merchant)
    item_1 = create(:item, merchant: merchant)
    item_2 = create(:item, merchant: merchant)

    get "/api/v1/items/find?id=#{item_1.id}"

    expect(response).to be_successful

    item = JSON.parse(response.body)
    expect(item["data"]["attributes"]["id"]).to eq(item_1.id)
  end

  it "can find all item by id" do
    merchant = create(:merchant)
    item_1 = create(:item, merchant: merchant)
    item_2 = create(:item, merchant: merchant)

    get "/api/v1/items/find_all?id=#{item_1.id}"

    expect(response).to be_successful

    items = JSON.parse(response.body)
    expect(items["data"].count).to eq(1)
  end

  it "can find first item by name" do
    merchant = create(:merchant)
    item_1 = create(:item, merchant: merchant)
    item_2 = create(:item, merchant: merchant)

    get "/api/v1/items/find?name=#{item_1.name}"

    expect(response).to be_successful

    item = JSON.parse(response.body)
    expect(item["data"]["attributes"]["name"]).to eq(item_1.name)
  end

  it "can find all item by name" do
    merchant = create(:merchant)
    item_1 = create(:item, merchant: merchant, name: "ity")
    item_2 = create(:item, merchant: merchant)

    get "/api/v1/items/find_all?name=#{item_1.name.upcase}"

    expect(response).to be_successful

    items = JSON.parse(response.body)
    expect(items["data"].count).to eq(1)
  end

  it "can find first item by description" do
    merchant = create(:merchant)
    item_1 = create(:item, merchant: merchant, description: "it's a thing")
    item_2 = create(:item, merchant: merchant)

    get "/api/v1/items/find?description=#{item_1.description}"

    expect(response).to be_successful

    item = JSON.parse(response.body)
    expect(item["data"]["attributes"]["description"]).to eq(item_1.description)
  end

  it "can find all item by description" do
    merchant = create(:merchant)
    item_1 = create(:item, merchant: merchant, description: "its a thing")
    item_2 = create(:item, merchant: merchant, description: "its a thing")
    item_3 = create(:item, merchant: merchant, description: "its not a thing")

    get "/api/v1/items/find_all?description=#{item_1.description.upcase}"

    expect(response).to be_successful

    items = JSON.parse(response.body)
    expect(items["data"].count).to eq(2)
  end

end
