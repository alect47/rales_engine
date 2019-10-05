class Invoice < ApplicationRecord
  validates_presence_of :customer_id
  validates_presence_of :merchant_id
  validates_presence_of :status

  belongs_to :customer
  belongs_to :merchant
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :transactions

  def self.order_invoice
    order(:id)
  end

  def self.invoice_for_transaction(invoice_params)
    joins(:transactions).find_by(transactions: {id: invoice_params})
  end

  def self.find_by_invoiceitem(invoice_params)
    joins(:invoice_items).find_by(invoice_items: {id: invoice_params})
  end
end
