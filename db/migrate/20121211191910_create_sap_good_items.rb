class CreateSapGoodItems < ActiveRecord::Migration
  def change
    create_table :"sap.good_items" do |t|
      t.integer :id
      t.integer :good_id, null: false
      t.string  :good_id_in_store, null: false
      t.decimal :price, null: false
      t.integer :store_id, null: false
      t.integer :order_pos, default: nil

      t.timestamps
    end
  end
end
