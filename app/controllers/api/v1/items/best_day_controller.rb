class Api::V1::Items::BestDayController < ApplicationController

  def show
    item = Item.find(params[:item_id])
    render json: BestDaySerializer.new(item.best_day).json
  end
end
