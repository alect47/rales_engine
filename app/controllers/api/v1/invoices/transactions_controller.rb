class Api::V1::Invoices::TransactionsController < ApplicationController

  def index
    render json: TransactionSerializer.new(Transaction.where(transaction_params))
  end

private

  def transaction_params
    params.permit(:invoice_id)
  end
end
