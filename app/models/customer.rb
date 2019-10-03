class Customer < ApplicationRecord
  validates_presence_of :first_name
  validates_presence_of :last_name

  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices
  has_many :items, through: :invoice_items

  def self.find_downcase(customer_params)
    if customer_params[:first_name]
      find_by('lower(first_name) like ?', "%#{customer_params.values.first}%")
    else
      find_by('lower(last_name) like ?', "%#{customer_params.values.first}%")
    end
  end

  # def self.find_last_downcase(customer_params)
  #   find_by('lower(last_name) like ?', "%#{customer_params.values.first}%")
  # end
end
