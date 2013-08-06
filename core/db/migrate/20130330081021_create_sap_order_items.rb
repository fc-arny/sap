# -------------------------------------------------------------
# GoodList of order
# -------------------------------------------------------------
class CreateSapOrderItems < ActiveRecord::Migration
  def change
    create_table :sap_order_items, :comment => 'GoodList of order' do |t|

      t.references :order, null: false,                       comment: 'Order ID'
      t.references :good_item, null: false,                   comment: 'GoodItem ID'
      t.integer :value, null: false,                          comment: 'Good value. Ex.: 100 packs or 1500 gram'

      t.timestamps
    end

    # Indexes
    add_index :sap_order_items, [:order_id, :good_item_id], :unique => true
    add_index :sap_order_items, :good_item_id
    add_index :sap_order_items, :order_id

    # Foreign keys
    add_foreign_key :sap_order_items, :sap_orders, :column => :order_id
    add_foreign_key :sap_order_items, :sap_good_items, :column => :good_item_id

  end
end
