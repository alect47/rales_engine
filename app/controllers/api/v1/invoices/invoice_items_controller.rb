class Api::V1::Invoices::InvoiceItemsController < ApplicationController

  def index
    render json: InvoiceItemSerializer.new(InvoiceItem.where(invoice_item_params))
  end

private

  def invoice_item_params
    params.permit(:invoice_id)
  end
end
