# -------------------------------------------------------------
# API for goods   s
# -------------------------------------------------------------
class Sap::Api::V1::GoodItemsController < Sap::Api::BaseController
  DEFAULT_LIMIT = 3

  # Group params
  wrap_parameters :good_item, :include => [:store]

  # -------------------------------------------------------------
  # List of goods
  # -------------------------------------------------------------
  def index

    @goods = Sap::GoodItem.filter(params[:filter])
    #  joins( {:good => :categories})
    #
    ## Set store
    #if !params[:store_id].nil?
    #  @goods = @goods.where('sap_good_items.store_id = ?', params[:store_id])
    #end
    #
    ## Set category
    #if !params[:category_id].nil?
    #  @goods = @goods.where('sap_categories.id = ?', params[:category_id])
    #end
    #
    #
    #
    #if params[:order_id]
    #  order = Sap::Order.get_by_hash(params[:order_id])
    #  @goods.joins("LEFT OUTER JOIN #{Sap::OrderItem} ON sap_order_items.good_item_id = sap_good_items.id AND sap_order_items.order_id = :order_id", :order_id => order.id) if order
    #end
    #
    ## Pagination
    #@limit  = DEFAULT_LIMIT
    #@offset = params[:page].to_i * DEFAULT_LIMIT || 0
    #
    @goods = @goods.limit( 10 )
  end

  # -------------------------------------------------------------
  # Search goods by params
  # -------------------------------------------------------------
  def search

  end

  # -------------------------------------------------------------
  # Create goods
  # -------------------------------------------------------------
  def create
    #if @task.save
    #  respond_with(@task)
    #else
    #  respond_with(@task, :status => :unprocessable_entity)
    #end

  end
end

