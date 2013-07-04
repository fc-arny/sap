# -------------------------------------------------------------
# Goods of store
# -------------------------------------------------------------
class CreateSapGoodItems < ActiveRecord::Migration
  def change
    create_table :sap_good_items, comment: 'Goods of store' do |t|

      t.references :good, null: false,             comment: 'Real good ID'
      t.string     :good_id_in_store, null: false, comment: 'Store inside good\'s ID for sync list'
      t.decimal    :price, null: false,            comment: 'Price in the store'
      t.references :store, null: false,            comment: 'Store ID'
      t.integer    :order_pos, default: nil,       content: 'Sorting value'

      t.timestamps
    end

    # Indexes
    add_index :sap_good_items, :id
    add_index :sap_good_items, :store_id
    add_index :sap_good_items, :good_id
    add_index :sap_good_items, [:good_id_in_store, :store_id], :unique => true

    # Foreign keys
    add_foreign_key :sap_good_items, :sap_goods, :column => :good_id
    add_foreign_key :sap_good_items, :sap_stores, :column => :store_id
  end
end
