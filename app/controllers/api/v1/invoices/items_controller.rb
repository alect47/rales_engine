class Api::V1::Invoices::ItemsController < ApplicationController

  def index
    render json: ItemSerializer.new(Item.item_for_invoice(item_params[:invoice_id]))
  end

private

  def item_params
    params.permit(:invoice_id)
  end
end
