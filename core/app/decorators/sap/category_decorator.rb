class Sap::CategoryDecorator < ApplicationDecorator
  decorate Sap::Category

  # Set of fields for list of categories ( index action )
  def index_set
    Jbuilder.new do |json|
      json.(model, :id, :name, :url, :parent_id)
    end
  end
end