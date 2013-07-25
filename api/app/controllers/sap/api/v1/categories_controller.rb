# -------------------------------------------------------------
# Category API
# -------------------------------------------------------------
class Sap::Api::V1::CategoriesController < Sap::Api::BaseController
  # -------------------------------------------------------------
  # Tree of categories
  # -------------------------------------------------------------
  def index
    categories = Sap::Category.get_category_tree
    respond_with categories
  end
end
