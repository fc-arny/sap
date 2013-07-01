class CreateSapAddresses < ActiveRecord::Migration
  def change
    create_table :sap_addresses do |t|
      t.integer :id
      t.integer :region_id
      t.string :street
      t.string :title
      t.string :comment

      t.timestamps
    end
  end
end
