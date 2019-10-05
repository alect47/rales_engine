class Transaction < ApplicationRecord
  validates_presence_of :invoice_id
  validates_presence_of :credit_card_number
  validates_presence_of :result

  belongs_to :invoice

  scope :successful, -> {where(result:"success")}

  def self.order_transaction
    order(:id)
  end

  def self.find_all_by_customer(transaction_params)
    joins(:invoice).where(invoices: {customer_id: transaction_params})
  end
end
