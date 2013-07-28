# -------------------------------------------------------------
# Order's goods
# -------------------------------------------------------------
class Sap::Api::V1::OrderItemsController < Sap::Api::BaseController

  # Group params
  wrap_parameters :item, :include => [:id,:value,:good_item_id, :order_id]

  # -------------------------------------------------------------
  # Update order item
  # -------------------------------------------------------------
  def update
    order = Sap::Order.get_by_hash(params[:order_id]) or raise ActiveRecord::RecordNotFound

    params[:item][:order_id] = order.id

    order_item = Sap::OrderItem.where('order_id = :order_id AND id = :id', order_item_params).first!
    order_item.update_attributes(order_item_params)

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

    order_item = Sap::OrderItem.where(order_item_params).first_or_initialize
    order_item.save()

    render_jsend :success => order_item
  end

  private
    # -------------------------------------------------------------
    # Params for mass-assignment
    # -------------------------------------------------------------
    def order_item_params
      params.require(:item).permit(:id, :value,:good_item_id, :order_id)
    end
end