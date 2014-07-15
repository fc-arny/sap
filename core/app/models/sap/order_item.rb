# == Schema Information
#
# Table name: sap_order_items
#
#  order_id     :integer          not null
#  good_item_id :integer          not null
#  value        :integer          not null
#  price        :decimal(8, 2)
#  created_at   :datetime
#  updated_at   :datetime
# ==============================
class Sap::OrderItem < Sap::Base   # TODO: move this table to redis or delete id column
  belongs_to :order, class_name: 'Sap::Order'
  belongs_to :good_item, class_name: 'Sap::GoodItem'

  scope :ordered, -> (order_id, good_items) { where('order_id = ? AND good_item_id IN (?)', order_id, good_items)}

  alias_attribute :gid, :good_item_id

  def current_price
    order.new? ? good_item.price : price
  end
end
