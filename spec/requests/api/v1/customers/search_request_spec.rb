require 'rails_helper'

describe "Customers search API" do
  it "can find first customer by id" do
    customer_1 = create(:customer)
    customer_2 = create(:customer)

    get "/api/v1/customers/find?id=#{customer_1.id}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)
    expect(customer["data"]["attributes"]["id"]).to eq(customer_1.id)
  end

  it "can find all customers by id" do
    customer_1 = create(:customer, id: 1)
    customer_2 = create(:customer, id: 2)

    get "/api/v1/customers/find_all?id=#{customer_1.id}"

    expect(response).to be_successful

    customers = JSON.parse(response.body)
    expect(customers["data"].count).to eq(1)
  end

  it "can find customer by first_name case insensitive" do
    customer_1 = create(:customer, first_name: "Alec")
    customer_2 = create(:customer, first_name: "Luke")
    get "/api/v1/customers/find?first_name=#{customer_1.first_name.upcase}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)
    expect(customer["data"]["attributes"]["id"]).to eq(customer_1.id)
  end

  it "can find all customers by first_name case insensitive" do
    customer_1 = create(:customer, first_name: "Alec")
    customer_2 = create(:customer, first_name: "Alec")
    customer_3 = create(:customer, first_name: "Luke")
    get "/api/v1/customers/find_all?first_name=#{customer_1.first_name.upcase}"

    expect(response).to be_successful

    customers = JSON.parse(response.body)
    expect(customers["data"].count).to eq(2)
  end

  it "can find customer by last_name case insensitive" do
    customer_1 = create(:customer, first_name: "Alec")
    customer_2 = create(:customer, first_name: "Luke")
    get "/api/v1/customers/find?last_name=#{customer_1.last_name.upcase}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)
    expect(customer["data"]["attributes"]["id"]).to eq(customer_1.id)
  end

  it "can find all customers by last_name case insensitive" do
    customer_1 = create(:customer, last_name: "Alec")
    customer_2 = create(:customer, last_name: "Alec")
    customer_3 = create(:customer, last_name: "Luke")
    get "/api/v1/customers/find_all?last_name=#{customer_1.last_name.upcase}"

    expect(response).to be_successful

    customers = JSON.parse(response.body)
    expect(customers["data"].count).to eq(2)
  end

  it "can find customer by created_at" do
    customer_1 = create(:customer, created_at: '2019-10-04 10:19:22 UTC')
    get "/api/v1/customers/find?created_at=2019-10-04T10:19:22.000z"

    expect(response).to be_successful
    customer = JSON.parse(response.body)
    expect(customer["data"]["attributes"]["id"]).to eq(customer_1.id)
  end

  it "can find all customers by created_at" do
    customer_1 = create(:customer, created_at: '2019-10-04 10:19:22 UTC')
    customer_2 = create(:customer, created_at: '2019-10-04 10:19:22 UTC')
    customer_3 = create(:customer, created_at: '2019-10-03 10:19:22 UTC')
    get "/api/v1/customers/find_all?created_at=#{customer_1.created_at}"

    expect(response).to be_successful

    customers = JSON.parse(response.body)
    expect(customers["data"].count).to eq(2)
  end

  it "can find customer by updated_at" do
    customer_1 = create(:customer, updated_at: '2019-10-04 10:19:22 UTC')

    get "/api/v1/customers/find?updated_at=2019-10-04T10:19:22.000z"

    expect(response).to be_successful
    customer = JSON.parse(response.body)
    expect(customer["data"]["attributes"]["id"]).to eq(customer_1.id)
  end

  it "can find all customers by updated_at" do
    customer_1 = create(:customer, updated_at: '2019-10-04 10:19:22 UTC')
    customer_2 = create(:customer, updated_at: '2019-10-04 10:19:22 UTC')
    customer_3 = create(:customer, updated_at: '2019-10-03 10:19:22 UTC')
    get "/api/v1/customers/find_all?updated_at=#{customer_1.updated_at}"

    expect(response).to be_successful

    customers = JSON.parse(response.body)
    expect(customers["data"].count).to eq(2)
  end

end
