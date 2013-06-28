class CreateSapCustomers < ActiveRecord::Migration
  def change
    create_table :"sap.customers" do |t|
      t.string :phone, :null => false
      t.string :name
      t.boolean :is_proved, default: false, null: false

      t.timestamps
    end
  end
end
