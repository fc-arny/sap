# -------------------------------------------------------------
# Decorator for good item model
# -------------------------------------------------------------
class Sap::GoodItemDecorator < ApplicationDecorator
  decorate Sap::GoodItem

  # Good list
  def list_set
    Jbuilder.new do |json|
      # GoodItem fields
      json.(model, :id, :price, :store_id)

      # Good fields
      json.good do
        json.(model.good, :id, :name, :description, :value)
      end
    end
  end

  # Detailed view
  def view_set(args)
    #list_set
    Jbuilder.new do |json|
      json.(model, :id, :price, :store_id)

      # Good fields
      json.good do
        json.(model.good, :id, :name, :description, :value)
      end

      # Price for this good at other stores
      prices = args[:prices] || {}
      json.prices prices do |price|
        json.(price, :store_id, :price)
      end

      reviews = [{author: 'Arthur', text: 'Cool'},{author: 'Nick', text: 'So bad ;-('}]
      json.reviews reviews do |review|
        json.author review[:author]
        json.text review[:text]
      end
    end

    # TODO: Add reviews, prices and other info about good
  end
end