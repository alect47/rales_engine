class Api::V1::Customers::SearchController < ApplicationController

  def index
    render json: CustomerSerializer.new(Customer.where(customer_params))

  end

  def show
    render json: CustomerSerializer.new(Customer.find_by(customer_params))
    # binding.pry
  end

private

  def customer_params
    params.permit(:first_name, :last_name, :id, :created_at, :updated_at)
  end
end
