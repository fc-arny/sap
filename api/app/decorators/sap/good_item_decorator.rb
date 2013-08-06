# -------------------------------------------------------------
# Decorator for good item model
# -------------------------------------------------------------
class Sap::GoodItemDecorator < ApplicationDecorator
  decorate Sap::GoodItem

  def list_set(json)
    # GoodItem fields
    json.(model, :id, :price, :store_id, :good_id)

    # Good fields
    json.(model.good, :name, :description, :measure_value)

    # How much in basket
    json.value model.value

    # Cost
    unless model.value.nil?
      json.cost
    end
  end
end