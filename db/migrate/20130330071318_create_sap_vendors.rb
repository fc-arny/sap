class CreateSapVendors < ActiveRecord::Migration
  def change
    create_table :'sap.vendors' do |t|
      t.integer :id
      t.string :name

      t.timestamps
    end
  end
end
