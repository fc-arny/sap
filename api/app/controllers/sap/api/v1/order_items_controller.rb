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
    render_jsend :error => t('No this good in your basket')
  end

  # Add good to order
  # POST /api/v1/order/items/
  def create
    @order_item = Sap::OrderItem.
      where('good_item_id = :gi_id AND order_id = :order_id', gi_id: params[:good_item_id], order_id: params[:order_id]).
      first_or_initialize

    unless @order_item.id
      @order_item.update_attributes(order_item_params)
      @order_item.save()
    else
      @status = :fail
      @message = t('This item already in the basket')
    end
  end

  private
    # Params for mass-assignment
    def order_item_params
      params.permit(:value,:good_item_id, :order_id)
    end
end