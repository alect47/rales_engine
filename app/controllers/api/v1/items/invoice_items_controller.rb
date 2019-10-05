class Api::V1::Items::InvoiceItemsController < ApplicationController

  def index
    render json: InvoiceItemSerializer.new(InvoiceItem.where(invoice_item_params))
  end

private

  def invoice_item_params
    params.permit(:item_id)
  end
end
