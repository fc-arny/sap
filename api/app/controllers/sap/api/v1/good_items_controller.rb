# -------------------------------------------------------------
# API for good_items
# -------------------------------------------------------------
class Sap::Api::V1::GoodItemsController < Sap::Api::BaseController

  # List of good items
  # GET /api/v1/good/items
  def index
    @goods = Sap::GoodItem.filter(filter_params, sort_params)

    @count  = @goods.count.to_i
    @limit  = (params[:limit] || 10).to_i
    @offset = (params[:offset] || 0).to_i

    @goods = @goods.limit(@limit).offset(@offset)
  end

  # View good item
  # GET /api/v1/good/items/:id
  def show
    @good_item = Sap::GoodItem.
      includes(:good).
      find(params[:id])

    @prices = Sap::GoodItem.where(good_id: @good_item.good_id)
  end

  private

  def filter_params
    if params[:category]
      category_id = params[:category].to_i > 0 ? params[:category] : Sap::Category.by_url(params[:category]).id
      params[:filter] = {category: category_id}
    end

    params[:filter] || {}
  end

  def sort_params
    params[:sort]
  end
end

