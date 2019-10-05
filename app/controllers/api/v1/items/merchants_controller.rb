class Api::V1::Items::MerchantsController < ApplicationController

  def show
    render json: MerchantSerializer.new(Merchant.find_by_item(merchant_params[:item_id]))
  end

private

  def merchant_params
    params.permit(:item_id)
  end
end
