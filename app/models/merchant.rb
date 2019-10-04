class Merchant < ApplicationRecord
  validates_presence_of :name

  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices
  # has/one/many transactions through invoices
  def self.find_name_downcase(merchant_params)
    find_by('lower(name) like ?', "%#{merchant_params.values.first}%")
  end

  def self.find_all_name_downcase(merchant_params)
    where('lower(name) like ?', "%#{merchant_params.values.first}%")
  end
  #
end

# Invoice.joins(:invoice_items, :transactions).select("sum(quantity * unit_price) as revenue
# ").where(" 'invoice.created_at.strftime("%m/%d/%Y")' = '03/25/2012'";)

# Invoice.joins(:transactions, :invoice_items)
#   .select('sum(invoice_items.quantity * invoice_items.unit_price) AS revenue')
#   .where("date(invoices.created_at) = '2012-03-09'")
#   .merge(Transaction.successful)

# Invoice.joins(:transactions, :invoice_items).select('sum(invoice_items.quantity * invoice_items.unit_price) AS revenue').where(created_at: '2012-03-09'.to_date.all_day).merge(Transaction.successful)
