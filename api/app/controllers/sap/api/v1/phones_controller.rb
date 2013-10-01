# -------------------------------------------------------------
# User phones
# -------------------------------------------------------------
class Sap::Api::V1::PhonesController < Sap::Api::BaseController

  # index
  def index
    current_user
  end
end