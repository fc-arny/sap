# -------------------------------------------------------------
# Base table for users
# -------------------------------------------------------------

class CreateSapUsers < ActiveRecord::Migration
  def change
    create_table :sap_users, :comment => 'Base model for all users' do |t|
      t.string     :login, null:false,              comment: 'Login string'
      t.string     :name,                           comment: 'All users should have name. Generated name'
      t.string     :encrypted_password, null:false, comment: 'Password hash'
      t.boolean    :is_temporary, default: false,   comment: 'Is temporary user(create temp customers)'

      t.references :role, :polymorphic => true,     comment: 'User role - admin, manager or customer'

      t.timestamps
    end

    # Indexes
    add_index :sap_users, :id
    add_index :sap_users, :login
  end
end
