# -------------------------------------------------------------
# Category API
# -------------------------------------------------------------
class Sap::Api::V1::CategoriesController < Sap::Api::BaseController

  # List of categories
  # GET /api/v1/categories/
  def index
    pid = params[:parent_id] || nil
    deep = params[:deep].to_i || 0
    @categories = Sap::Category.get_children_categories(pid, deep)
  end

end
