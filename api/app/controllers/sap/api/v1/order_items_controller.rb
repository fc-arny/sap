# -------------------------------------------------------------
# Order's goods
# -------------------------------------------------------------
class Sap::Api::V1::OrderItemsController < Sap::Api::BaseController

  # Update order item.
  def update
    @order_item = Sap::OrderItem.
      where('good_item_id = :gi_id AND order_id = :order_id', gi_id: params[:good_item_id], order_id: params[:order_id]).
      first or raise ActiveRecord::RecordNotFound

    @order_item.update_attributes(order_item_params)

  rescue ActiveRecord::RecordNotFound
    #render_jsend :error => t('No this good in your basket')
  end

  # Add good to order
  # POST /api/v1/order/items/
  def create
    @order_item = current_order.items.where('good_item_id = ?', params[:good_item_id]).first_or_initialize
    order_item_params[:value] > 0 ? @order_item.update_attributes(order_item_params) : @order_item.destroy
  end

  private

  def order_item_params
    p = params.permit(:value,:good_item_id)
    p[:order_id] = current_order.id
    p
  end
end