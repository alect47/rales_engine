class Api::V1::Items::SearchController < ApplicationController

  def index
    render json: ItemSerializer.new(Item.order_items.where(item_params))
  end

  def show
    render json: ItemSerializer.new(Item.order_items.find_by(item_params))
  end

private

  def item_params
    params[:unit_price] = (params[:unit_price].to_f*100).round(0) if params[:unit_price]
    # params[:created_at] = params[:created_at].gsub("T", " ").gsub("Z", "")[0..-5] if params[:created_at]
    params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end
end
