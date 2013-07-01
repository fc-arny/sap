class CreateSapVendors < ActiveRecord::Migration
  def change
    create_table :sap_vendors do |t|

      t.string :name

      t.timestamps
    end
  end
end
