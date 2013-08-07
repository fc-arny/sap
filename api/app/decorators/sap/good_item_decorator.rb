# -------------------------------------------------------------
# Decorator for good item model
# -------------------------------------------------------------
class Sap::GoodItemDecorator < ApplicationDecorator
  decorate Sap::GoodItem

  def list_set(json)
    # GoodItem fields
    json.(model, :id, :price, :store_id)

    # Good fields
    json.good do
      json.(model.good, :id, :name, :description, :value)
    end
  end
end