# -------------------------------------------------------------
# API for good_items
# -------------------------------------------------------------
class Sap::Api::V1::GoodItemsController < Sap::Api::BaseController

  # List of good items
  # GET /api/v1/good/items
  def index
    @goods = Sap::GoodItem.filter(params[:filter], params[:sort])

    @count  = @goods.count.to_i
    @offset = (params[:offset] || 0).to_i
    @limit  = (params[:limit] || @count - @offset).to_i

    @goods = @goods.limit(@limit).offset(@offset)
  end

  # View good item
  # GET /api/v1/good/items/:id
  def show
    t = user_signed_in?
    @good_item = Sap::GoodItem.
      includes(:good).
      find(params[:id])

    @prices = Sap::GoodItem.where(:good_id => @good_item.good_id)
  end
end

