class Api::V1::Merchants::ItemsController < ApplicationController

  def index
    render json: ItemSerializer.new(Item.where(item_params))
  end

private

  def item_params
    params.permit(:merchant_id)
  end

end
