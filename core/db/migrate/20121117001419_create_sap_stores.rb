# -------------------------------------------------------------
# Create table for store
# -------------------------------------------------------------
class CreateSapStores < ActiveRecord::Migration
  def change
    create_table :sap_stores,               comment: 'List of stores' do |t|
      t.string      :name, null: false,     comment: 'Store\'s name'
      t.integer     :order_pos, default: 0, comment: 'Value for sorting stores'
      t.string      :url, null: false,      comment: 'Url segment'
      t.references  :region,                comment: 'Link to region'
      t.time        :work_time_from,        comment: 'Store start work'
      t.time        :work_time_to,          comment: 'Store stop work'
      t.timestamps
    end

    # Indexes
    add_index :sap_stores, :id

    # Foreign keys
    add_foreign_key :sap_stores, :sap_regions, :column => :region_id
  end
end


