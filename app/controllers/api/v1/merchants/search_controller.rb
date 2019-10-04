class Api::V1::Merchants::SearchController < ApplicationController

  def index
    if merchant_params[:name]
      # binding.p/ry
      render json: MerchantSerializer.new(Merchant.find_all_name_downcase(merchant_params))
    else
      render json: MerchantSerializer.new(Merchant.where(merchant_params))
    end
  end

  def show
    if merchant_params[:name]
      render json: MerchantSerializer.new(Merchant.find_name_downcase(merchant_params))
    elsif !merchant_params.empty?
      render json: MerchantSerializer.new(Merchant.find_by(merchant_params))
    end
    # render json: MerchantSerializer.new(Merchant.find_by(merchant_params))
  end

private

  def merchant_params
    params[:name] = params[:name].downcase if params[:name]
    params.permit(:name, :id, :created_at, :updated_at)
  end
end
