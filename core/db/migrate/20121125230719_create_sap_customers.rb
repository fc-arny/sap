# -------------------------------------------------------------
# SAP's customers
# -------------------------------------------------------------
class CreateSapCustomers < ActiveRecord::Migration
  def change
    create_table :sap_customers, comment: 'Customers' do |t|
      t.string :name, :null => false,         comment: 'Customer name'
      t.string :phone, :null => false,        comment: 'Customer phone'
      t.string :email,                        comment: 'Customer email'
      t.boolean :is_approved, default: false, comment: 'Is customer approved'

      t.timestamps
    end

    # Indexes
    add_index :sap_customers, :id
    add_index :sap_customers, :phone
    add_index :sap_customers, :email

  end
end
