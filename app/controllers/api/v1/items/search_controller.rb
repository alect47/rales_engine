class Api::V1::Items::SearchController < ApplicationController

  def index
    if item_params[:name]
      render json: ItemSerializer.new(Item.find_all_name_downcase(item_params))
    elsif item_params[:description]
      render json: ItemSerializer.new(Item.find_all_description_downcase(item_params))
    else
      render json: ItemSerializer.new(Item.where(item_params))
    end
    # render json: ItemSerializer.new(Item.order_items.where(item_params))
  end

  def show
    if item_params[:name]
      render json: ItemSerializer.new(Item.find_name_downcase(item_params))
    elsif item_params[:description]
      render json: ItemSerializer.new(Item.find_description_downcase(item_params))
    elsif !item_params.empty?
      render json: ItemSerializer.new(Item.find_by(item_params))
    end
    # render json: ItemSerializer.new(Item.order_items.find_by(item_params))
  end

private

  def item_params
    params[:name] = params[:name].downcase if params[:name]
    params[:description] = params[:description].downcase if params[:description]
    params[:unit_price] = (params[:unit_price].to_f*100).round(0) if params[:unit_price]
    # params[:created_at] = params[:created_at].gsub("T", " ").gsub("Z", "")[0..-5] if params[:created_at]
    params.permit(:id, :name, :description, :unit_price, :merchant_id, :created_at, :updated_at)
  end
end
