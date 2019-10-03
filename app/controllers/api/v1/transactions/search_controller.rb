class Api::V1::Transactions::SearchController < ApplicationController

  def index
    render json: TransactionSerializer.new(Transaction.order_transaction.where(transaction_params))
  end

  def show
    render json: TransactionSerializer.new(Transaction.order_transaction.find_by(transaction_params))
  end

private

  def transaction_params
    # params[:unit_price] = (params[:unit_price].to_f*100).round(0) if params[:unit_price]
    # params[:created_at] = params[:created_at].gsub("T", " ").gsub("Z", "")[0..-5] if params[:created_at]
    params.permit(:id, :invoice_id, :credit_card_number, :result, :credit_card_expiration_date, :created_at, :updated_at)
  end
end
