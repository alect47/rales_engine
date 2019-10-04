require 'rails_helper'

describe "Invoices search API" do
  it "can find first invoice by id" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer)
    invoice_2 = create(:invoice, merchant: merchant, customer: customer)

    get "/api/v1/invoices/find?id=#{invoice_1.id}"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)
    expect(invoice["data"]["attributes"]["id"]).to eq(invoice_1.id)
  end

  it "can find all invoice by id" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer)
    invoice_2 = create(:invoice, merchant: merchant, customer: customer)

    get "/api/v1/invoices/find_all?id=#{invoice_1.id}"

    expect(response).to be_successful

    invoices = JSON.parse(response.body)
    expect(invoices["data"].count).to eq(1)
  end

  it "can find first invoice by customer_id" do
    merchant = create(:merchant)
    customer = create(:customer)
    customer_2 = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer)
    invoice_2 = create(:invoice, merchant: merchant, customer: customer_2)

    get "/api/v1/invoices/find?customer_id=#{customer.id}"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)
    expect(invoice["data"]["attributes"]["id"]).to eq(invoice_1.id)
  end

  it "can find all invoice by customer_id" do
    merchant = create(:merchant)
    customer = create(:customer)
    customer_2 = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer)
    invoice_2 = create(:invoice, merchant: merchant, customer: customer_2)

    get "/api/v1/invoices/find_all?customer_id=#{customer.id}"

    expect(response).to be_successful

    invoices = JSON.parse(response.body)
    expect(invoices["data"].count).to eq(1)
  end

  it "can find first invoice by status" do
    merchant = create(:merchant)
    customer = create(:customer)
    customer_2 = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer, status: "shipped")
    invoice_2 = create(:invoice, merchant: merchant, customer: customer_2)

    get "/api/v1/invoices/find?status=shipped"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)
    expect(invoice["data"]["attributes"]["id"]).to eq(invoice_1.id)
  end

  it "can find all invoice by status" do
    merchant = create(:merchant)
    customer = create(:customer)
    customer_2 = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer, status: "shipped")
    invoice_2 = create(:invoice, merchant: merchant, customer: customer_2, status: "shipped")

    get "/api/v1/invoices/find_all?status=shipped"

    expect(response).to be_successful

    invoices = JSON.parse(response.body)
    expect(invoices["data"].count).to eq(2)
  end

  it "can find first invoice by merchant_id" do
    merchant = create(:merchant)
    customer = create(:customer)
    customer_2 = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer)
    invoice_2 = create(:invoice, merchant: merchant, customer: customer_2)

    get "/api/v1/invoices/find?merchant_id=#{merchant.id}"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)
    expect(invoice["data"]["attributes"]["id"]).to eq(invoice_1.id)
  end

  it "can find all invoice by merchant_id" do
    merchant = create(:merchant)
    merchant_2 = create(:merchant)
    customer = create(:customer)
    customer_2 = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer)
    invoice_2 = create(:invoice, merchant: merchant_2, customer: customer_2)

    get "/api/v1/invoices/find_all?merchant_id=#{merchant.id}"

    expect(response).to be_successful

    invoices = JSON.parse(response.body)
    expect(invoices["data"].count).to eq(1)
  end

  it "can find first invoice by created_at" do
    merchant = create(:merchant)
    customer = create(:customer)
    customer_2 = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer, created_at: '2019-10-04 10:19:22 UTC')
    invoice_2 = create(:invoice, merchant: merchant, customer: customer_2)

    get "/api/v1/invoices/find?created_at=2019-10-04T10:19:22.000z"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)
    expect(invoice["data"]["attributes"]["id"]).to eq(invoice_1.id)
  end

  it "can find all invoice by created_at" do
    merchant = create(:merchant)
    merchant_2 = create(:merchant)
    customer = create(:customer)
    customer_2 = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer, created_at: '2019-10-04 10:19:22 UTC')
    invoice_2 = create(:invoice, merchant: merchant_2, customer: customer_2)

    get "/api/v1/invoices/find_all?created_at=2019-10-04T10:19:22.000z"

    expect(response).to be_successful

    invoices = JSON.parse(response.body)
    expect(invoices["data"].count).to eq(1)
  end

  it "can find first invoice by updated_at" do
    merchant = create(:merchant)
    customer = create(:customer)
    customer_2 = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer, updated_at: '2019-10-04 10:19:22 UTC')
    invoice_2 = create(:invoice, merchant: merchant, customer: customer_2)

    get "/api/v1/invoices/find?updated_at=2019-10-04T10:19:22.000z"

    expect(response).to be_successful

    invoice = JSON.parse(response.body)
    expect(invoice["data"]["attributes"]["id"]).to eq(invoice_1.id)
  end

  it "can find all invoice by updated_at" do
    merchant = create(:merchant)
    merchant_2 = create(:merchant)
    customer = create(:customer)
    customer_2 = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer, updated_at: '2019-10-04 10:19:22 UTC')
    invoice_2 = create(:invoice, merchant: merchant_2, customer: customer_2)

    get "/api/v1/invoices/find_all?updated_at=2019-10-04T10:19:22.000z"

    expect(response).to be_successful

    invoices = JSON.parse(response.body)
    expect(invoices["data"].count).to eq(1)
  end
end
