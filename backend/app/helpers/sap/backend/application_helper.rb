module Sap::Backend::ApplicationHelper
  # Backend sidebar
  def backend_sidebar(type = 'common')
    render "sap/backend/common/menu/main/#{type}"
  end

  # Quick statistic
  def backend_quick_stat
    render 'sap/backend/shared/stat'
  end

  # Bread crumbs 
  def backend_breadcrumbs
    render 'sap/backend/shared/breadcrumbs'
  end
end

