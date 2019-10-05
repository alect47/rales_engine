class Api::V1::InvoiceItems::ItemsController < ApplicationController

  def show
    render json: ItemSerializer.new(Item.order_items.find_by_invoiceitem(item_params[:invoice_item_id]))
  end

private

  def item_params
    params.permit(:invoice_item_id)
  end
end
