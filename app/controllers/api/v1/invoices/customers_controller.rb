class Api::V1::Invoices::CustomersController < ApplicationController

  def show
    render json: CustomerSerializer.new(Customer.find_by_invoice(customer_params[:invoice_id]))
  end

private

  def customer_params
    params.permit(:invoice_id)
  end
end
