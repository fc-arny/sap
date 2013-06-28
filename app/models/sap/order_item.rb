# == Schema Information
#
# Table name: sap.order_items
#
#  id           :integer          not null, primary key
#  order_id     :integer
#  good_item_id :integer
#  count        :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

# -------------------------------------------------------------
# Like a "BASKET"
# -------------------------------------------------------------
# ==Fields
# :count    - just count
# :good_id  - link to good list item
# :order_id - link to total order
# -------------------------------------------------------------
class Sap::OrderItem < SapModel
  # Fields
  attr_accessible :id, :count, :good_item_id, :order_id

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
