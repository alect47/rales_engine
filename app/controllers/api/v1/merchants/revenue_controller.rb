class Api::V1::Merchants::RevenueController < ApplicationController

  def show
    # merchant = Merchant.find(params[:id])
    # date = params[:date]
    revenue = Invoice.total_revenue_by_date(params[:date])
    render json: RevenueSerializer.new(revenue).json
  end
end
