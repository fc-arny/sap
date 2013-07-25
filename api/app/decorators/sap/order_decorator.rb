# -------------------------------------------------------------
# Order model decorator
# -------------------------------------------------------------
class Sap::OrderDecorator < ApplicationDecorator
  decorates Sap::Order

  # -------------------------------------------------------------
  #
  # -------------------------------------------------------------
  def index_set(json)
    json.(model, :id, :state)
  end
end

