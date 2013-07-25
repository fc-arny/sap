# -------------------------------------------------------------
# Orders model
# -------------------------------------------------------------
class CreateSapOrders < ActiveRecord::Migration
  def change
    create_table :sap_orders, comment: 'Order model' do |t|

      t.string :state, null: false,     comment: 'Order state - new, payed etc'
      t.string :hash_str, null: false,  comment: 'Hash for order access'
      t.decimal :sum
      t.references :user,               comment: 'Customer.user_id - link to user'
      t.string :phone,                  comment: 'Phone string'
      t.string :address,                comment: 'Address string'
      t.string :comment,                comment: 'Order comment'
      t.timestamps
    end

    # Indexes
    add_index :sap_orders, :id

    # Foreign keys
    add_foreign_key :sap_orders, :sap_users, :column => :user_id
  end
end
