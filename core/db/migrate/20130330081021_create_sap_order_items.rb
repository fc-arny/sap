# -------------------------------------------------------------
# GoodList of order
# -------------------------------------------------------------
class CreateSapOrderItems < ActiveRecord::Migration
  def change
    create_table 'sap.order_items', :id => false, :comment => 'GoodList of order' do |t|

      t.references :order, null: false,                       comment: 'Order ID'
      t.references :good_item, null: false,                   comment: 'Good(item) ID'
      t.integer    :value, null: false,                       comment: 'Good value. Ex.: 100 packs or 1500 gram'
      t.decimal    :price, precision: 8, scale: 2,            comment: 'Current price for product'

      t.timestamps
    end

    # Indexes
    add_index 'sap.order_items', [:order_id, :good_item_id], :unique => true
    add_index 'sap.order_items', :order_id

    # Foreign keys
    add_foreign_key 'sap.order_items', 'sap.orders', :column => :order_id
    add_foreign_key 'sap.order_items', 'sap.good_items',  :column => :good_item_id

  end
end
