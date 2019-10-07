class Customer < ApplicationRecord
  validates_presence_of :first_name
  validates_presence_of :last_name

  has_many :invoices
  has_many :invoice_items, through: :invoices
  has_many :transactions, through: :invoices
  has_many :items, through: :invoice_items
  has_many :merchants, through: :invoices

  def favorite_merchant
    merchants.joins(invoices: :transactions)
    .merge(Transaction.successful)
    .group(:id)
    .order("count(transactions.id) desc")
    .limit(1)
    .first
  end

  def self.find_downcase(customer_params)
    if customer_params[:first_name]
      find_by('lower(first_name) like ?', "%#{customer_params.values.first}%")
    else
      find_by('lower(last_name) like ?', "%#{customer_params.values.first}%")
    end
  end

  def self.find_all_downcase(customer_params)
    if customer_params[:first_name]
      where('lower(first_name) like ?', "%#{customer_params.values.first}%")
    else
      where('lower(last_name) like ?', "%#{customer_params.values.first}%")
    end
  end

  def self.find_by_invoice(customer_params)
    joins(:invoices).find_by(invoices: {id: customer_params})
  end

end
