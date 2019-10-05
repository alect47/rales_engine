class Api::V1::Invoices::MerchantsController < ApplicationController

  def show
    render json: MerchantSerializer.new(Merchant.find_by_invoice(merchant_params[:invoice_id]))
  end

private

  def merchant_params
    params.permit(:invoice_id)
  end

end
