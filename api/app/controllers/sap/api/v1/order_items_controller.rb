# -------------------------------------------------------------
# Order's goods
# -------------------------------------------------------------
class Sap::Api::V1::OrderItemsController < Sap::Api::BaseController

  # Group params
  wrap_parameters :item, :include => [:count,:good_item_id]

  # -------------------------------------------------------------
  # Update order item
  # -------------------------------------------------------------
  def update
    order = Sap::Order.get_by_hash(params[:order_id]) or raise ActiveRecord::RecordNotFound

    order_item = Sap::OrderItem.where("order_id = :order_id AND id = :id", {:id => params[:id], :order_id => order.id}).first!
    order_item.update_attributes(params[:item])

    render_jsend :success => order_item
  rescue ActiveRecord::RecordNotFound
    render_jsend :error => t('No this good in your basket')
  end

  # -------------------------------------------------------------
  # Add goot to order
  # -------------------------------------------------------------
  def create
    order = Sap::Order.get_by_hash params[:order_id]
    raise "Wrong order's identifier" if order.nil?

    params[:item][:order_id] = order.id

    order_item = Sap::OrderItem.where(params[:item]).first_or_initialize
    order_item.save()

    render_jsend :success => order_item
  end
end