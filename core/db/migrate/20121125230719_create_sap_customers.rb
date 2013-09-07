# -------------------------------------------------------------
# SAP's customers
# -------------------------------------------------------------
class CreateSapCustomers < ActiveRecord::Migration
  def change
    create_table :sap_customers, comment: 'Customers' do |t|
      t.string :first_name,                   comment: 'Customer name'
      t.string :last_name,                    comment: 'Customer surname'
      t.string :phone, :null => false,        comment: 'Customer phone'
      t.boolean :is_approved, default: false, comment: 'Is customer approved'
    end

    # Indexes
    add_index :sap_customers, :id
    add_index :sap_customers, :phone
    add_index :sap_customers, :email

  end
end
