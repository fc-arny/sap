# -------------------------------------------------------------
# Regions table
# -------------------------------------------------------------
class CreateSapRegions < ActiveRecord::Migration
  def change
    create_table :'sap.regions', comment: 'Regions.ex Moscow(chld: Reutov, Rublevo, Lyubertsy etc)' do |t|

      t.string  :name, null: false,         comment: 'Region name'
      t.string  :description,               comment: 'Description for region'
      t.integer :parent_id, default: nil,   comment: 'Big region can have smaller subregions'
      t.timestamps
    end

    # Parent region
    add_foreign_key :'sap.regions', :'sap.regions', :column => :parent_id
  end
end
