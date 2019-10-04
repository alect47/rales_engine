require 'rails_helper'

describe "Merchants search API" do
  it "can find first merchant by id" do
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)

    get "/api/v1/merchants/find?id=#{merchant_1.id}"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)
    expect(merchant["data"]["attributes"]["id"]).to eq(merchant_1.id)
  end

  it "can find all merchants by id" do
    merchant_1 = create(:merchant, id: 1)
    merchant_2 = create(:merchant, id: 2)

    get "/api/v1/merchants/find_all?id=#{merchant_1.id}"

    expect(response).to be_successful

    merchants = JSON.parse(response.body)
    expect(merchants["data"].count).to eq(1)
  end

  it "can find merchant by name case insensitive" do
    merchant_1 = create(:merchant, name: "Alec")
    merchant_2 = create(:merchant, name: "Luke")
    get "/api/v1/merchants/find?name=#{merchant_1.name.upcase}"

    expect(response).to be_successful

    merchant = JSON.parse(response.body)
    expect(merchant["data"]["attributes"]["id"]).to eq(merchant_1.id)
  end

  it "can find all merchants by name case insensitive" do
    merchant_1 = create(:merchant, name: "Alec")
    merchant_2 = create(:merchant, name: "Alec")
    merchant_4 = create(:merchant, name: "Luke")
    get "/api/v1/merchants/find_all?name=#{merchant_1.name.upcase}"

    expect(response).to be_successful

    merchants = JSON.parse(response.body)
    expect(merchants["data"].count).to eq(2)
  end

  it "can find merchant by created_at" do
    merchant_1 = create(:merchant, created_at: '2019-10-04 10:19:22 UTC')
    get "/api/v1/merchants/find?created_at=2019-10-04T10:19:22.000z"

    expect(response).to be_successful
    merchant = JSON.parse(response.body)
    expect(merchant["data"]["attributes"]["id"]).to eq(merchant_1.id)
  end

  it "can find all merchants by created_at" do
    merchant_1 = create(:merchant, created_at: '2019-10-04 10:19:22 UTC')
    merchant_2 = create(:merchant, created_at: '2019-10-04 10:19:22 UTC')
    merchant_4 = create(:merchant, created_at: '2019-10-03 10:19:22 UTC')
    get "/api/v1/merchants/find_all?created_at=#{merchant_1.created_at}"

    expect(response).to be_successful

    merchants = JSON.parse(response.body)
    expect(merchants["data"].count).to eq(2)
  end

  it "can find merchant by updated_at" do
    merchant_1 = create(:merchant, updated_at: '2019-10-04 10:19:22 UTC')

    get "/api/v1/merchants/find?updated_at=2019-10-04T10:19:22.000z"

    expect(response).to be_successful
    merchant = JSON.parse(response.body)
    expect(merchant["data"]["attributes"]["id"]).to eq(merchant_1.id)
  end

  it "can find all merchants by updated_at" do
    merchant_1 = create(:merchant, updated_at: '2019-10-04 10:19:22 UTC')
    merchant_2 = create(:merchant, updated_at: '2019-10-04 10:19:22 UTC')
    merchant_4 = create(:merchant, updated_at: '2019-10-03 10:19:22 UTC')
    get "/api/v1/merchants/find_all?updated_at=#{merchant_1.updated_at}"

    expect(response).to be_successful

    merchants = JSON.parse(response.body)
    expect(merchants["data"].count).to eq(2)
  end

end
