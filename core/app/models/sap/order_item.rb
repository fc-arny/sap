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
  attr_accessible :good_id, :store_id, :value, :price, :order_id

  # Accociations
  belongs_to :order, :class_name => 'Sap::Order'
  belongs_to :good_item, :class_name => 'Sap::GoodItem'

  class << self
    # -------------------------------------------------------------
    # Get order goods by order
    # -------------------------------------------------------------
    def get_by_order_id(id)
      self.where(
          'order_id = :order_id',
          {:order_id => id}
      )
    end

  end

  # -------------------------------------------------------------
  # JSON for model
  # -------------------------------------------------------------
  def as_json(options = {})
    # Good's settings
    good_setting = [
      :good => {:only => [:id, :name]}
    ]

    # GoodItem's settings
    good_item_setting = [
      :good_item => {
        :only => [:id,:price,:store_id],
        :include => good_setting
      }
    ]

    order = super(options.merge( :include => good_item_setting ))
  end
end
