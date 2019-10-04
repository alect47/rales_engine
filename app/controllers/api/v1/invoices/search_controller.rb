class Api::V1::Invoices::SearchController < ApplicationController

  def index
    render json: InvoiceSerializer.new(Invoice.order_invoice.where(invoice_params))
  end

  def show
    render json: InvoiceSerializer.new(Invoice.order_invoice.find_by(invoice_params))
  end

private

  def invoice_params
    params.permit(:id, :customer_id, :merchant_id, :status, :created_at, :updated_at)
  end
end
