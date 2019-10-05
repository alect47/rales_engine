class Api::V1::Transactions::InvoicesController < ApplicationController

  def show
    render json: InvoiceSerializer.new(Invoice.invoice_for_transaction(invoice_params[:transaction_id]))
  end

private

  def invoice_params
    params.permit(:transaction_id)
  end
end
