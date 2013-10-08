# -------------------------------------------------------------
# Create table for store
# -------------------------------------------------------------
class CreateSapStores < ActiveRecord::Migration
  def change
    create_table :'sap.stores' do |t|
      t.string      :name, null: false,     comment: 'Store\'s name'
      t.integer     :order_pos, default: 0, comment: 'Value for sorting stores'
      t.string      :url, null: false,      comment: 'Url segment'
      t.string      :system_name,           comment: 'Internal name of store'
      t.boolean     :active, default: false,comment: 'Work with this store or not'
      t.references  :region,                comment: 'Link to region'
      t.time        :work_time_from,        comment: 'Store start work'
      t.time        :work_time_to,          comment: 'Store stop work'
      t.timestamps
    end

    # Foreign keys
    add_foreign_key 'sap.stores', 'sap.regions', :column => :region_id
  end
end


