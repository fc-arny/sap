# -------------------------------------------------------------
# API for good_items
# -------------------------------------------------------------
class Sap::Api::V1::Good::ItemsController < Sap::Api::BaseController

  # -------------------------------------------------------------
  # List of good items
  # -------------------------------------------------------------
  def index
    @goods = Sap::GoodItem.filter(params[:filter], params[:sort])

    @count  = @goods.count.to_i
    @offset = (params[:offset] || 0).to_i
    @limit  = (params[:limit] || @count - @offset).to_i

    @goods = @goods.limit(@limit).offset(@offset)
  end

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

