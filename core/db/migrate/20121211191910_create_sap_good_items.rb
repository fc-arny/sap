# -------------------------------------------------------------
# Goods of store
# -------------------------------------------------------------
class CreateSapGoodItems < ActiveRecord::Migration
  def change
    create_table 'sap.good_items', comment: 'Goods of store' do |t|

      t.references :good, null: false,                    comment: 'Real good ID'
      t.string     :store_gid, null: false,               comment: 'Store inside good\'s ID for sync list'
      t.decimal    :price, null: false, precision: 8, scale: 2,  comment: 'Price in the store'
      t.references :store, null: false,                   comment: 'Store ID'
      t.boolean    :is_available, default: true,          comment: 'Does store have this good'
      t.integer    :order_pos, default: nil,              content: 'Sorting value'

      t.timestamps
    end

    # Indexes
    add_index 'sap.good_items', :store_id
    add_index 'sap.good_items', :good_id
    add_index 'sap.good_items', [:store_gid, :store_id], :unique => true

    # Foreign keys
    add_foreign_key 'sap.good_items', 'sap.goods',  :column => :good_id
    add_foreign_key 'sap.good_items', 'sap.stores', :column => :store_id
  end
end
