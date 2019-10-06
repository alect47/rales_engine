class Api::V1::Customers::FavoriteMerchantController < ApplicationController

  def show
    customer = Customer.find(params[:customer_id])
    merchant = customer.favorite_merchant
    render json: MerchantSerializer.new(merchant)
  end
end
