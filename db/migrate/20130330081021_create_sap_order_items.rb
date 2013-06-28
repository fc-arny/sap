class CreateSapOrderItems < ActiveRecord::Migration
  def change
    create_table :'sap.order_items' do |t|
      t.integer :id
      t.integer :order_id
      t.integer :good_item_id
      t.integer :count

      t.timestamps
    end

    add_index :'sap.order_items', [:order_id, :good_item_id], :unique => true
  end
end
