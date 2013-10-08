# -------------------------------------------------------------
# SAP's customers
# -------------------------------------------------------------
class CreateSapCustomers < ActiveRecord::Migration
  def change
    create_table :'sap.customers', comment: 'Customers' do |t|
      t.string :first_name,                   comment: 'Customer name'
      t.string :last_name,                    comment: 'Customer surname'
      t.string :phone, :null => false,        comment: 'Customer phone'
      t.boolean :is_approved, default: false, comment: 'Is customer approved'
    end

    # Indexes
    add_index :'sap.customers', :phone
  end
end
