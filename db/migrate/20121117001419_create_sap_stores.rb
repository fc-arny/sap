# -------------------------------------------------------------
# Create table for store
# -------------------------------------------------------------
class CreateSapStores < ActiveRecord::Migration
  def change
    create_table :sap_stores,           comment: 'List of stores' do |t|
      t.string  :name, null: false,     comment: 'Store\'s name'
      t.integer :order_pos, default: 0, comment: 'Value for sorting stores'
      t.string  :url, null: false,      comment: 'Url segment'
      t.string  :region_id,             comment: 'LInk to store\'s region'
      t.time    :work_time_from
      t.time    :work_time_to
      t.timestamps
    end
  end
end


