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

  def self.find_name_downcase(item_params)
    find_by('lower(name) like ?', "%#{item_params.values.first}%")
  end

  def self.find_all_name_downcase(item_params)
    where('lower(name) like ?', "%#{item_params.values.first}%")
  end

  def self.find_description_downcase(item_params)
    find_by('lower(description) like ?', "%#{item_params.values.first}%")
  end

  def self.find_all_description_downcase(item_params)
    where('lower(description) like ?', "%#{item_params.values.first}%")
  end
end
