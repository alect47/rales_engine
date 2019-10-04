class Api::V1::Items::SearchController < ApplicationController

  def index
    if item_params[:name]
      render json: ItemSerializer.new(Item.order_items.find_all_name_downcase(item_params))
    elsif item_params[:description]
      render json: ItemSerializer.new(Item.order_items.find_all_description_downcase(item_params))
    elsif item_params[:unit_price]
      render json: ItemSerializer.new(Item.order_items.find_all_price(item_params))
    else
      render json: ItemSerializer.new(Item.order_items.where(item_params))
    end
  end

  def show
    if item_params[:name]
      render json: ItemSerializer.new(Item.order_items.find_name_downcase(item_params))
    elsif item_params[:description]
      render json: ItemSerializer.new(Item.order_items.find_description_downcase(item_params))
    elsif item_params[:unit_price]
      render json: ItemSerializer.new(Item.order_items.find_price(item_params))
    else
      render json: ItemSerializer.new(Item.order_items.find_by(item_params))
    end
  end

private

  def item_params
    # binding.pry
    # params[:unit_price] = (params[:unit_price].to_f*100).round(0) if params[:unit_price]
    params[:name] = params[:name].downcase if params[:name]
    params[:description] = params[:description].downcase if params[:description]
    # params[:created_at] = params[:created_at].gsub("T", " ").gsub("Z", "")[0..-5] if params[:created_at]
    params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end
end
