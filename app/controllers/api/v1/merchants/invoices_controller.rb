class Api::V1::Merchants::InvoicesController < ApplicationController

  def index
    render json: InvoiceSerializer.new(Invoice.where(invoice_params))
  end

private

  def invoice_params
    params.permit(:merchant_id)
  end

end
