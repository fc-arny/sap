# -------------------------------------------------------------
# API for goods
# -------------------------------------------------------------
class Sap::Api::V1::GoodsController < Sap::Api::BaseController

  # -------------------------------------------------------------
  # Good items' list
  # -------------------------------------------------------------
  def list
    @goods = Sap::GoodItem.filter(params[:filter])
  end

end