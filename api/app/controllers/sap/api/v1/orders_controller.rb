# -------------------------------------------------------------
# API controller for working with Order and OrderList models
# -------------------------------------------------------------
class Sap::Api::V1::OrdersController < Sap::Api::BaseController

  # GET /api/v1/orders - Get list of orders
  def index
    order_by = params[:sort_by] ? [params[:sort_by], params[:order]].join(' ') : 'id DESC'
    # Fetch order by Id and Hash
    @orders = Sap::Order.order(order_by).page(params[:page]).per(params[:per_page])
  end

  # POST /api/v1/orders - Create order
  def create
    order = Sap::Order.new
    order.state = Sap::Order::ST_NEW
    # TODO: определять текущего пользователя
    # TODO: вместо хеша к каждой таблице, будет одна таблца с хешами
    order.hash_str  = Sap::Tools.get_random_string(6)
    order.save

    @id = order.id
  end

  # PATCH/PUT /api/v1/orders/:id - Update order model
  def update
    @order = Sap::Order.find(params[:id]) or raise ActiveRecord::RecordNotFound
  rescue ActiveRecord::RecordNotFound
    @message  = t('No this good in your basket')
    @status   = :error
  end


  # Show order
  # GET /api/v1/orders/:id
  def show
    @order = params[:id] == 'basket' ? current_order :  Sap::Order.find(params[:id]) # TODO: order: Auth
    @order = Sap::Order.first
  end
end