class Api::V1::InvoiceItems::InvoicesController < ApplicationController

  def show
    # binding.pry
    render json: InvoiceSerializer.new(Invoice.order_invoice.find_by_invoiceitem(invoice_params[:invoice_item_id]))
  end

private

  def invoice_params
    # binding.pry
    params.permit(:invoice_item_id)
  end
end
