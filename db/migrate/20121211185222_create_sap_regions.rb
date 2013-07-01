class CreateSapRegions < ActiveRecord::Migration
  def change
    create_table :sap_regions do |t|
      t.integer :id
      t.string :name
      t.string :state
      t.string :description

      t.timestamps
    end
  end
end
