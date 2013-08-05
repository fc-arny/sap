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

  # -------------------------------------------------------------
  # Geting filtred, sorted, ordered goods
  # -------------------------------------------------------------
  def self.filter(attributes, sort = nil, order = nil)
    # Query for know what goods in basket
    order_id = attributes[:order] || nil
    order_item_sql  = Sap::OrderItem.where('order_id = ?', order_id).to_sql

    relation = self.joins(:good => :categories).
      joins("LEFT OUTER JOIN  (#{order_item_sql}) sap_order_items on sap_order_items.good_item_id = sap_good_items.id"  ).
      select('sap_good_items.*', 'sap_order_items.*', 'sap_goods.*').
      distinct!

    # Filter
    attributes.inject(relation) do |scope,(key,value)|

      return scope if value.blank?
      case key.to_sym
        when :store
          scope.where(:store_id => value)
        when :category
          scope.where(:sap_category_good => {category_id: value})
        else
          scope
      end

    end
  end

  # -------------------------------------------------------------
  #
  # -------------------------------------------------------------
  def self.sort

  end
end
