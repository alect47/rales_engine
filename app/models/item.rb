class Item < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :unit_price
  validates_presence_of :merchant_id

  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  has_many :transactions, through: :invoices

  def self.order_items
    order(:id)
  end

  def self.find_by_invoiceitem(invoice_params)
    joins(:invoice_items).find_by(invoice_items: {id: invoice_params})
  end

  def self.find_name_downcase(item_params)
    find_by('lower(name) like ?', "#{item_params.values.first}")
  end

  def self.find_all_name_downcase(item_params)
    where('lower(name) like ?', "#{item_params.values.first}")
  end

  def self.find_description_downcase(item_params)
    find_by('lower(description) like ?', "#{item_params.values.first}")
  end

  def self.find_all_description_downcase(item_params)
    where('lower(description) like ?', "#{item_params.values.first}")
  end

  def self.find_price(item_params)
    find_by('(unit_price) = ?', "#{((item_params.values.first).to_f*100).round(0)}")
  end

  def self.find_all_price(item_params)
    where('(unit_price) = ?', "#{((item_params.values.first).to_f*100).round(0)}")
  end

  def self.item_for_invoice(item_params)
    joins(:invoices).where(invoices: {id: item_params})
  end

  def self.most_revenue(quantity)
    joins(:transactions, :invoice_items)
    .select("items.*, sum(invoice_items.quantity * invoice_items.unit_price) as rev")
    .group(:id)
    .merge(Transaction.successful)
    .order('rev desc')
    .limit(quantity)
  end


  def best_day
    invoices.joins(:transactions)
      .merge(Transaction.successful)
      .select("invoices.created_at AS date, sum(invoice_items.quantity) AS num_sold")
      .group('date')
      .order('num_sold desc, date desc')
      .limit(1)[0].date
  end
  #Why doesn't this work?
  # def best_day
  #   invoices.joins(:transactions, :invoice_items)
  #     .merge(Transaction.successful)
  #     .select("invoices.created_at AS date, sum(invoice_items.quantity) AS num_sold")
  #     .group('date')
  #     .order('num_sold desc, date desc')
  #     .limit(1)[0].date
  # end

end
