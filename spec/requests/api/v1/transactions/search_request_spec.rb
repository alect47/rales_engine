require 'rails_helper'

describe "Transactions search API" do
  it "can find first transaction by id" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer)
    transaction_1 = create(:transaction, invoice: invoice_1)
    transaction_2 = create(:transaction, invoice: invoice_1)
    get "/api/v1/transactions/find?id=#{transaction_1.id}"

    expect(response).to be_successful

    transactions = JSON.parse(response.body)
    expect(transactions["data"]["attributes"]["id"]).to eq(transaction_1.id)
  end

  it "can find all transactions by id" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer)
    transaction_1 = create(:transaction, invoice: invoice_1)
    id = transaction_1.id
    get "/api/v1/transactions/find_all?id=#{transaction_1.id}"

    transactions = JSON.parse(response.body)

    expect(response).to be_successful
    expect(transactions["data"].count).to eq(1)
  end

  it "can find first transaction by invoice_id" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer)
    transaction_1 = create(:transaction, invoice: invoice_1)
    transaction_2 = create(:transaction, invoice: invoice_1)
    get "/api/v1/transactions/find?invoice_id=#{invoice_1.id}"

    expect(response).to be_successful

    transactions = JSON.parse(response.body)
    expect(transactions["data"]["attributes"]["id"]).to eq(transaction_1.id)
  end

  it "can find all transactions by invoice_id" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer)
    transaction_1 = create(:transaction, invoice: invoice_1)
    id = transaction_1.id
    get "/api/v1/transactions/find_all?invoice_id=#{invoice_1.id}"

    transactions = JSON.parse(response.body)

    expect(response).to be_successful
    expect(transactions["data"].count).to eq(1)
  end

  it "can find first transaction by credit_card_number" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer)
    transaction_1 = create(:transaction, invoice: invoice_1, credit_card_number: 123456789101112)
    transaction_2 = create(:transaction, invoice: invoice_1)
    get "/api/v1/transactions/find?credit_card_number=#{transaction_1.credit_card_number}"

    expect(response).to be_successful

    transactions = JSON.parse(response.body)
    expect(transactions["data"]["attributes"]["id"]).to eq(transaction_1.id)
  end

  it "can find all transactions by credit_card_number" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer)
    transaction_1 = create(:transaction, invoice: invoice_1, credit_card_number: 123456789101112)
    id = transaction_1.id
    get "/api/v1/transactions/find_all?credit_card_number=#{transaction_1.credit_card_number}"

    transactions = JSON.parse(response.body)

    expect(response).to be_successful
    expect(transactions["data"].count).to eq(1)
  end

  it "can find first transaction by result" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer)
    transaction_1 = create(:transaction, invoice: invoice_1, result: "succ")
    transaction_2 = create(:transaction, invoice: invoice_1)
    get "/api/v1/transactions/find?result=#{transaction_1.result}"

    expect(response).to be_successful

    transactions = JSON.parse(response.body)
    expect(transactions["data"]["attributes"]["id"]).to eq(transaction_1.id)
  end

  it "can find all transactions by result" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer)
    transaction_1 = create(:transaction, invoice: invoice_1, result: "succ")
    id = transaction_1.id
    get "/api/v1/transactions/find_all?result=#{transaction_1.result}"

    transactions = JSON.parse(response.body)

    expect(response).to be_successful
    expect(transactions["data"].count).to eq(1)
  end

  it "can find first transaction by created_at" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer)
    transaction_1 = create(:transaction, invoice: invoice_1, created_at: '2019-10-04 10:19:22 UTC')
    transaction_2 = create(:transaction, invoice: invoice_1)
    get "/api/v1/transactions/find?created_at=#{transaction_1.created_at}"

    expect(response).to be_successful

    transactions = JSON.parse(response.body)
    expect(transactions["data"]["attributes"]["id"]).to eq(transaction_1.id)
  end

  it "can find all transactions by created_at" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer)
    transaction_1 = create(:transaction, invoice: invoice_1, created_at: '2019-10-04 10:19:22 UTC')
    id = transaction_1.id
    get "/api/v1/transactions/find_all?created_at=#{transaction_1.created_at}"

    transactions = JSON.parse(response.body)

    expect(response).to be_successful
    expect(transactions["data"].count).to eq(1)
  end

  it "can find first transaction by updated_at" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer)
    transaction_1 = create(:transaction, invoice: invoice_1, updated_at: '2019-10-04 10:19:22 UTC')
    transaction_2 = create(:transaction, invoice: invoice_1)
    get "/api/v1/transactions/find?updated_at=#{transaction_1.updated_at}"

    expect(response).to be_successful

    transactions = JSON.parse(response.body)
    expect(transactions["data"]["attributes"]["id"]).to eq(transaction_1.id)
  end

  it "can find all transactions by updated_at" do
    merchant = create(:merchant)
    customer = create(:customer)
    invoice_1 = create(:invoice, merchant: merchant, customer: customer)
    transaction_1 = create(:transaction, invoice: invoice_1, updated_at: '2019-10-04 10:19:22 UTC')
    id = transaction_1.id
    get "/api/v1/transactions/find_all?updated_at=#{transaction_1.updated_at}"

    transactions = JSON.parse(response.body)

    expect(response).to be_successful
    expect(transactions["data"].count).to eq(1)
  end
end
