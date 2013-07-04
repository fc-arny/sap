# -------------------------------------------------------------
# Base table for users
# -------------------------------------------------------------

class CreateSapUsers < ActiveRecord::Migration
  def change
    create_table :sap_users, :comment => 'Base model for all users' do |t|
      t.string     :login, null:false,              comment: 'Login string'
      t.string     :name,                           comment: 'All users should have name. Generated name'
      t.string     :password, null:false,           comment: 'Password: secret key = md5(md5(password) + salt)'
      t.string     :salt, null:false,               comment: 'Salt - random string for security'
      t.boolean    :is_temporary, default: false,   comment: 'Is temporary user(create temp customers)'
      t.string     :token,                          comment: 'Token for reset password'
      t.datetime   :valid_token_to,                 comment: 'Token expiration date'
      t.references :role, :polymorphic => true,     comment: 'User role - admin, manager or customer'

      t.timestamps
    end

    # Indexes
    add_index :sap_users, :id
    add_index :sap_users, :login
  end
end
