# -------------------------------------------------------------
# Decorator for good item model
# -------------------------------------------------------------
class Sap::GoodItemDecorator < ApplicationDecorator
  decorate Sap::GoodItem

  def index_set(json)
    # GoodItem fields
    json.(model, :id, :price, :store_id)

    # Order
    #if model.order_items.value > 0
    #  json.value model.order_items.value
    #  #json.order do
    #  #  json.(model.order_items, :id, :order_id, :value)
    #  #end
    #end

    # Good fields
    json.(model.good, :name, :description, :measure_value)
    json.good_id model.good.id
  end

  # -------------------------------------------------------------
  #
  # -------------------------------------------------------------
  def list_set(json)
    json.(model, :id, :price, :store_id)
    json.name model.good.name
  end
end