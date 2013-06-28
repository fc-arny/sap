# == Schema Information
#
# Table name: sap.good_items
#
#  id         :integer          not null, primary key
#  good_id    :integer          not null
#  price      :decimal(, )      not null
#  store_id   :integer          not null
#  order_pos  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# -------------------------------------------------------------
# Stores' goods
# -------------------------------------------------------------
# ==Fields:
# good_id                 - link to Sap::Good
# good_id_in_store        - identificator in store system
# order_pos               - for sorting
# price                   - product's price
# store_id                - link to store
# -------------------------------------------------------------
class Sap::GoodItem < SapModel
  # Fields
  attr_accessible :good_id, :id, :order_pos, :price, :store_id

  # Relationships
  belongs_to :good, :class_name => 'Sap::Good'
  belongs_to :store, :class_name => 'Sap::Store'
  has_many   :order_items, :class_name => 'Sap::OrderItem'
end
