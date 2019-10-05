class Api::V1::Customers::SearchController < ApplicationController

  def index
    if customer_params[:first_name] || customer_params[:last_name]
      render json: CustomerSerializer.new(Customer.find_all_downcase(customer_params))
    else
      render json: CustomerSerializer.new(Customer.where(customer_params))
    end
  end

  def show
    if customer_params[:first_name] || customer_params[:last_name]
      render json: CustomerSerializer.new(Customer.find_downcase(customer_params))
    elsif !customer_params.empty?
      render json: CustomerSerializer.new(Customer.find_by(customer_params))
    end
  end

private

  def customer_params
    params[:first_name] = params[:first_name].downcase if params[:first_name]
    params[:last_name] = params[:last_name].downcase if params[:last_name]
    params.permit(:first_name, :last_name, :id, :created_at, :updated_at)
  end
end
