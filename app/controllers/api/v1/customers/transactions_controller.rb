class Api::V1::Customers::TransactionsController < ApplicationController

  def index
    render json: TransactionSerializer.new(Transaction.find_all_by_customer(transaction_params[:customer_id]))
  end

private

  def transaction_params
    params.permit(:customer_id)
  end
end
