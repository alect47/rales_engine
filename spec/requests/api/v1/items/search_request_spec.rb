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

  it "can find all items by id" do
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

    get "/api/v1/items/find?name=#{item_1.name.upcase}"

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

    get "/api/v1/items/find?description=#{item_1.description.upcase}"

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

  it "can find first item by unit_price" do
    merchant = create(:merchant)
    item_1 = create(:item, merchant: merchant, unit_price: 12345)
    item_2 = create(:item, merchant: merchant)

    get "/api/v1/items/find?unit_price=123.45"

    expect(response).to be_successful

    item = JSON.parse(response.body)
    expect(item["data"]["attributes"]["unit_price"]).to eq("123.45")
  end

  it "can find all item by unit_price" do
    merchant = create(:merchant)
    item_1 = create(:item, merchant: merchant, unit_price: 12345)
    item_2 = create(:item, merchant: merchant, unit_price: 12345)
    item_3 = create(:item, merchant: merchant, unit_price: 45678)

    get "/api/v1/items/find_all?unit_price=123.45"

    expect(response).to be_successful

    items = JSON.parse(response.body)
    expect(items["data"].count).to eq(2)
  end

  it "can find first item by created_at" do
    merchant = create(:merchant)
    item_1 = create(:item, merchant: merchant)
    item_2 = create(:item, merchant: merchant)

    get "/api/v1/items/find?merchant_id=#{merchant.id}"

    expect(response).to be_successful

    item = JSON.parse(response.body)
    expect(item["data"]["attributes"]["merchant_id"]).to eq(merchant.id)
  end

  it "can find all item by merchant_id" do
    merchant = create(:merchant)
    merchant_2 = create(:merchant)
    item_1 = create(:item, merchant: merchant)
    item_2 = create(:item, merchant: merchant)
    item_3 = create(:item, merchant: merchant_2)

    get "/api/v1/items/find_all?merchant_id=#{merchant.id}"

    expect(response).to be_successful

    items = JSON.parse(response.body)
    expect(items["data"].count).to eq(2)
  end

  it "can find first item by created_at" do
    merchant = create(:merchant)
    item_1 = create(:item, merchant: merchant, created_at: '2019-10-04 10:19:22 UTC')
    item_2 = create(:item, merchant: merchant)

    get "/api/v1/items/find?created_at=2019-10-04T10:19:22.000z"

    expect(response).to be_successful

    item = JSON.parse(response.body)
    expect(item["data"]["attributes"]["id"]).to eq(item_1.id)
  end

  it "can find all item by created_at" do
    merchant = create(:merchant)
    merchant_2 = create(:merchant)
    item_1 = create(:item, merchant: merchant, created_at: '2019-10-04 10:19:22 UTC')
    item_2 = create(:item, merchant: merchant, created_at: '2019-10-04 10:19:22 UTC')
    item_3 = create(:item, merchant: merchant_2)

    get "/api/v1/items/find_all?created_at=2019-10-04T10:19:22.000z"

    expect(response).to be_successful

    items = JSON.parse(response.body)
    expect(items["data"].count).to eq(2)
  end

  it "can find first item by updated_at" do
    merchant = create(:merchant)
    item_1 = create(:item, merchant: merchant, updated_at: '2019-10-04 10:19:22 UTC')
    item_2 = create(:item, merchant: merchant)

    get "/api/v1/items/find?updated_at=2019-10-04T10:19:22.000z"

    expect(response).to be_successful

    item = JSON.parse(response.body)
    expect(item["data"]["attributes"]["id"]).to eq(item_1.id)
  end

  it "can find all item by updated_at" do
    merchant = create(:merchant)
    merchant_2 = create(:merchant)
    item_1 = create(:item, merchant: merchant, updated_at: '2019-10-04 10:19:22 UTC')
    item_2 = create(:item, merchant: merchant, updated_at: '2019-10-04 10:19:22 UTC')
    item_3 = create(:item, merchant: merchant_2)

    get "/api/v1/items/find_all?updated_at=2019-10-04T10:19:22.000z"

    expect(response).to be_successful

    items = JSON.parse(response.body)
    expect(items["data"].count).to eq(2)
  end

end
