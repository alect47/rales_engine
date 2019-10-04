require 'rails_helper'

describe "Invoice Items search API" do
  it "can find first invoice_item by id" do
    merchant = create(:merchant)
    item = create(:item, merchant: merchant)
    customer = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer)
    invoice_item_1 = create(:invoice_item, item: item, invoice: invoice_1)
    invoice_item_2 = create(:invoice_item, item: item, invoice: invoice_1)
    get "/api/v1/invoice_items/find?id=#{invoice_item_1.id}"

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)
    expect(invoice_items["data"]["attributes"]["id"]).to eq(invoice_item_1.id)
  end

  it "can find all invoice_items by id" do
    merchant = create(:merchant)
    item = create(:item, merchant: merchant)
    customer = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer)
    invoice_item_1 = create(:invoice_item, item: item, invoice: invoice_1)
    id = invoice_item_1.id
    get "/api/v1/invoice_items/find_all?id=#{invoice_item_1.id}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice_item["data"].count).to eq(1)
  end

  it "can find first invoice_item by item_id" do
    merchant = create(:merchant)
    item = create(:item, merchant: merchant)
    customer = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer)
    invoice_item_1 = create(:invoice_item, item: item, invoice: invoice_1)
    invoice_item_2 = create(:invoice_item, item: item, invoice: invoice_1)
    get "/api/v1/invoice_items/find?item_id=#{item.id}"

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)
    expect(invoice_items["data"]["attributes"]["id"]).to eq(invoice_item_1.id)
  end

  it "can find all invoice_items by item_id" do
    merchant = create(:merchant)
    item = create(:item, merchant: merchant)
    customer = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer)
    invoice_item_1 = create(:invoice_item, item: item, invoice: invoice_1)
    id = invoice_item_1.id
    get "/api/v1/invoice_items/find_all?item_id=#{item.id}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice_item["data"].count).to eq(1)
  end

  it "can find first invoice_item by invoice_id" do
    merchant = create(:merchant)
    item = create(:item, merchant: merchant)
    customer = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer)
    invoice_item_1 = create(:invoice_item, item: item, invoice: invoice_1)
    invoice_item_2 = create(:invoice_item, item: item, invoice: invoice_1)
    get "/api/v1/invoice_items/find?invoice_id=#{invoice_1.id}"

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)
    expect(invoice_items["data"]["attributes"]["id"]).to eq(invoice_item_1.id)
  end

  it "can find all invoice_items by invoice_id" do
    merchant = create(:merchant)
    item = create(:item, merchant: merchant)
    customer = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer)
    invoice_item_1 = create(:invoice_item, item: item, invoice: invoice_1)
    id = invoice_item_1.id
    get "/api/v1/invoice_items/find_all?invoice_id=#{invoice_1.id}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice_item["data"].count).to eq(1)
  end

  it "can find first invoice_item by quantity" do
    merchant = create(:merchant)
    item = create(:item, merchant: merchant)
    customer = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer)
    invoice_item_1 = create(:invoice_item, item: item, invoice: invoice_1, quantity: 4)
    invoice_item_2 = create(:invoice_item, item: item, invoice: invoice_1)
    get "/api/v1/invoice_items/find?quantity=#{invoice_item_1.quantity}"

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)
    expect(invoice_items["data"]["attributes"]["id"]).to eq(invoice_item_1.id)
  end

  it "can find all invoice_items by quantity" do
    merchant = create(:merchant)
    item = create(:item, merchant: merchant)
    customer = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer)
    invoice_item_1 = create(:invoice_item, item: item, invoice: invoice_1, quantity: 4)
    id = invoice_item_1.id
    get "/api/v1/invoice_items/find_all?quantity=#{invoice_item_1.quantity}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice_item["data"].count).to eq(1)
  end

  it "can find first invoice_item by unit_price" do
    merchant = create(:merchant)
    item = create(:item, merchant: merchant)
    customer = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer)
    invoice_item_1 = create(:invoice_item, item: item, invoice: invoice_1, unit_price: 4234)
    invoice_item_2 = create(:invoice_item, item: item, invoice: invoice_1)
    get "/api/v1/invoice_items/find?unit_price=42.34"

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)
    expect(invoice_items["data"]["attributes"]["id"]).to eq(invoice_item_1.id)
  end

  it "can find all invoice_items by unit_price" do
    merchant = create(:merchant)
    item = create(:item, merchant: merchant)
    customer = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer)
    invoice_item_1 = create(:invoice_item, item: item, invoice: invoice_1, unit_price: 4234)
    invoice_item_2 = create(:invoice_item, item: item, invoice: invoice_1, unit_price: 42345)
    id = invoice_item_1.id
    get "/api/v1/invoice_items/find_all?unit_price=42.34"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice_item["data"].count).to eq(1)
  end

  it "can find first invoice_item by created_at" do
    merchant = create(:merchant)
    item = create(:item, merchant: merchant)
    customer = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer)
    invoice_item_1 = create(:invoice_item, item: item, invoice: invoice_1, created_at: '2019-10-04 10:19:22 UTC')
    invoice_item_2 = create(:invoice_item, item: item, invoice: invoice_1)
    get "/api/v1/invoice_items/find?created_at=#{invoice_item_1.created_at}"

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)
    expect(invoice_items["data"]["attributes"]["id"]).to eq(invoice_item_1.id)
  end

  it "can find all invoice_items by created_at" do
    merchant = create(:merchant)
    item = create(:item, merchant: merchant)
    customer = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer)
    invoice_item_1 = create(:invoice_item, item: item, invoice: invoice_1, created_at: '2019-10-04 10:19:22 UTC')
    invoice_item_2 = create(:invoice_item, item: item, invoice: invoice_1, created_at: '2019-10-06 10:19:22 UTC')
    id = invoice_item_1.id
    get "/api/v1/invoice_items/find_all?created_at=#{invoice_item_1.created_at}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice_item["data"].count).to eq(1)
  end

  it "can find first invoice_item by updated_at" do
    merchant = create(:merchant)
    item = create(:item, merchant: merchant)
    customer = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer)
    invoice_item_1 = create(:invoice_item, item: item, invoice: invoice_1, updated_at: '2019-10-04 10:19:22 UTC')
    invoice_item_2 = create(:invoice_item, item: item, invoice: invoice_1)
    get "/api/v1/invoice_items/find?updated_at=#{invoice_item_1.updated_at}"

    expect(response).to be_successful

    invoice_items = JSON.parse(response.body)
    expect(invoice_items["data"]["attributes"]["id"]).to eq(invoice_item_1.id)
  end

  it "can find all invoice_items by updated_at" do
    merchant = create(:merchant)
    item = create(:item, merchant: merchant)
    customer = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer)
    invoice_item_1 = create(:invoice_item, item: item, invoice: invoice_1, updated_at: '2019-10-04 10:19:22 UTC')
    invoice_item_2 = create(:invoice_item, item: item, invoice: invoice_1, updated_at: '2019-10-06 10:19:22 UTC')
    id = invoice_item_1.id
    get "/api/v1/invoice_items/find_all?updated_at=#{invoice_item_1.updated_at}"

    invoice_item = JSON.parse(response.body)

    expect(response).to be_successful
    expect(invoice_item["data"].count).to eq(1)
  end
end
