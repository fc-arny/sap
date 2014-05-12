# -------------------------------------------------------------
# API for goods
# -------------------------------------------------------------
class Sap::Api::V1::GoodsController < Sap::Api::BaseController

  # Good items' list
  def index
    category   = Sap::Category.where(url: params[:url]).first
    categories = category.children
    @goods = Sap::GoodItem.filter(params[:filter], params[:sort])
    #
    #@count  = @goods.count.to_i
    #@offset = (params[:offset] || 0).to_i
    #@limit  = (params[:limit] || @count - @offset).to_i
    #
    @goods = @goods.limit(@limit).offset(@offset)
  end

end