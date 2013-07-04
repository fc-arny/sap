# == Schema Information
#
# Table name: sap_good_items # Object contained link to good object and good's price in the store
#
#  id               :integer          not null, primary key # Object contained link to good object and good's price in the store
#  good_id          :integer          not null              # Link to real good
#  good_id_in_store :string(255)      not null              # Store inside good's ID for sync list
#  price            :decimal(, )      not null              # Price in the store
#  store_id         :integer          not null              # The store
#  order_pos        :integer
#  created_at       :datetime
#  updated_at       :datetime
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
class Sap::GoodItem < ActiveRecord::Base
  # Fields
  attr_accessible :good_id, :id, :order_pos, :price, :store_id, :good_id_in_store

  # Relationships
  belongs_to :good, :class_name => 'Sap::Good'
  belongs_to :store, :class_name => 'Sap::Store'
  has_many   :order_items, :class_name => 'Sap::OrderItem'
end
