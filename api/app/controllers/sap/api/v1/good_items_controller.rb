# -------------------------------------------------------------
# API for good_items
# -------------------------------------------------------------
class Sap::Api::V1::GoodItemsController < Sap::Api::BaseController

  # -------------------------------------------------------------
  # GET /api/v1/good/items/:id
  # View good item
  # -------------------------------------------------------------
  def show
    @good_item = Sap::GoodItem.
      includes(:good).
      find(params[:id])

    @prices = Sap::GoodItem.where(:good_id => @good_item.good_id)
  end

  # -------------------------------------------------------------
  # Search goods by params
  # -------------------------------------------------------------
  def search

  end

  # -------------------------------------------------------------
  # Create goods
  # -------------------------------------------------------------
  def create
    #if @task.save
    #  respond_with(@task)
    #else
    #  respond_with(@task, :status => :unprocessable_entity)
    #end

  end
end

