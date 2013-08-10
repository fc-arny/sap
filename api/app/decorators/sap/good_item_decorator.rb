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
  def view_set
    #list_set
    Jbuilder.new do |json|
      json.(model, :id, :price, :store_id)

      # Good fields
      json.good do
        json.(model.good, :id, :name, :description, :value)
      end
    end


    #data
    # TODO: Add reviews, prices and other info about good
    #reviews = [{author: 'Arthur', text: 'Cool'},{author: 'Nick', text: 'So bad ;-('}]
    #
    #json.reviews reviews do |review|
    #  json.author review[:author]
    #  json.text review[:text]
    #end

  end
end