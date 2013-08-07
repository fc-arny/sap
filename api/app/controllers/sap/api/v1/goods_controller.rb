# -------------------------------------------------------------
# API for goods
# -------------------------------------------------------------
class Sap::Api::V1::GoodsController < Sap::Api::BaseController

  # -------------------------------------------------------------
  # Good items' list
  # -------------------------------------------------------------
  def list
    @goods = Sap::GoodItem.filter(params[:filter])

    @count  = @goods.count.to_i
    @offset = (params[:offset] || 0).to_i
    @limit  = (params[:limit] || @count - @offset).to_i

    @goods = @goods.limit(@limit).offset(@offset)
  end

end