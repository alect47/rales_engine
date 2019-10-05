class Api::V1::Customers::InvoicesController < ApplicationController

  def index
    render json: InvoiceSerializer.new(Invoice.order_invoice.where(invoice_params))
  end

private

  def invoice_params
    params.permit(:customer_id)
  end
end
