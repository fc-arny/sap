# == Schema Information
#
# Table name: sap_order_items
#
#  id           :integer          not null, primary key
#  order_id     :integer
#  good_item_id :integer
#  count        :integer
#  created_at   :datetime
#  updated_at   :datetime
# -------------------------------------------------------------
class Sap::OrderItem < ActiveRecord::Base   # TODO: move this table to redis or delete id column
  # Fields
  #attr_accessible :good_item_id, :store_id, :value, :price, :order_id

  # Accociations
  belongs_to :order, :class_name => 'Sap::Order'
  belongs_to :good_item, :class_name => 'Sap::GoodItem'

  # Filter order items
  def self.filter(attributes)
    relation = self.includes(:good_item => :good)

    attributes.inject(relation) do |scope, (key,value)|
      return scope if value.empty?

      case key.to_sym
        when :order
          scope.where(:order_id => value)
        when :store
          scope.where(:sap_good_items => {store_id: value})
        else
          scope
      end
    end
  end
end
