require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name}
  end

  describe 'relationships' do
    it { should have_many :items}
    it { should have_many :invoices}
    it { should have_many(:invoice_items).through(:invoices)}
  end

  describe 'methods' do
    it "most_revenue" do
      merchant = create(:merchant)
      customer = create(:customer)
      item = create(:item, merchant: merchant)
      invoice_1 = create(:invoice, merchant: merchant, customer: customer )
      invoice_item_1 = create(:invoice_item, item: item, invoice: invoice_1, quantity: 5, unit_price: 12345)
      invoice_item_2 = create(:invoice_item, item: item, invoice: invoice_1, quantity: 5, unit_price: 12345)
      transaction_1 = create(:transaction, invoice: invoice_1, result: "success")
      transaction_2 = create(:transaction, invoice: invoice_1, result: "success")

      merchants_returned = Merchant.most_revenue(1)
      expect(merchants_returned[0].name).to eq(merchant.name)
    end

    it "favorite_customer" do
      merchant = create(:merchant)
      customer = create(:customer)
      item = create(:item, merchant: merchant)
      invoice_1 = create(:invoice, merchant: merchant, customer: customer )
      invoice_item_1 = create(:invoice_item, item: item, invoice: invoice_1, quantity: 5, unit_price: 12345)
      invoice_item_2 = create(:invoice_item, item: item, invoice: invoice_1, quantity: 5, unit_price: 12345)
      transaction_1 = create(:transaction, invoice: invoice_1, result: "success")
      transaction_2 = create(:transaction, invoice: invoice_1, result: "success")

      merchants_returned = merchant.favorite_customer
      expect(merchants_returned).to eq(customer.id)
    end
  end
end
