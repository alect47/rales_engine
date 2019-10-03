require 'rails_helper'

describe "Customers search API" do
  it "can find customer by id" do
    customer_1 = create(:customer)
    customer_2 = create(:customer)

    get "/api/v1/customers/find?id=#{customer_1.id}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)
    expect(customer["data"]["attributes"]["id"]).to eq(customer_1.id)
  end

  it "can find customer by first_name case insensitive" do
    customer_1 = create(:customer, first_name: "Alec")
    customer_2 = create(:customer, first_name: "Luke")
    get "/api/v1/customers/find?first_name=#{customer_1.first_name.upcase}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)
    expect(customer["data"]["attributes"]["id"]).to eq(customer_1.id)
  end
  it "can find customer by last_name case insensitive" do
    customer_1 = create(:customer, first_name: "Alec")
    customer_2 = create(:customer, first_name: "Luke")
    get "/api/v1/customers/find?last_name=#{customer_1.last_name.upcase}"

    expect(response).to be_successful

    customer = JSON.parse(response.body)
    # binding.pry
    expect(customer["data"]["attributes"]["id"]).to eq(customer_1.id)
  end

end
