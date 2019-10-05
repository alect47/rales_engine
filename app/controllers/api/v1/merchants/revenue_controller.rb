class Api::V1::Merchants::RevenueController < ApplicationController

  def show
    merchant = Merchant.find(params[:id])
    date = params[:date]
    revenue = merchant.revenue_on_date(date)
    render json: RevenueSerializer.new(revenue).json
  end
end
