# Order model decorator
class Sap::OrderDecorator < ApplicationDecorator
  decorates Sap::Order

  # Index set of fields
  def index_set(order_items)
    Jbuilder.new do |json|
      json.(model, :id, :state, :sum, :user_id, :phone, :address, :comment)

      items = order_items
      json.items items do |item|

        # Culculate price at this time
        json.current_price (item.value/item.good_item.good.value) * item.good_item.price

        # Store
        json.store_id item.good_item.store_id

        # Order fields
        json.price item.price
        json.value item.value
        json.order_id item.order_id

        # Good and GoodItem fields
        json.good do
          json.name item.good_item.good.name
          json.value item.good_item.good.value
          json.price item.good_item.price
        end

      end
    end
  end
end

