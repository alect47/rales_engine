class ItemSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :description, :merchant_id, :unit_price

  attribute :unit_price do |object|
   "#{object.unit_price.to_f / 100}"
 end
end
