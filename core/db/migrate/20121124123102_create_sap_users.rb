# -------------------------------------------------------------
# Base table for users
# -------------------------------------------------------------

class CreateSapUsers < ActiveRecord::Migration
  def change
    create_table :sap_users, :comment => 'Base model for all users' do |t|
      t.string     :name,                           comment: 'All users should have name. Generated name'
      t.string     :login, null:false,              comment: 'User login'
      t.string     :email,                          comment: 'User email'
      t.string     :encrypted_password, null:false, comment: 'Password hash'
      t.boolean    :is_temporary, default: false,   comment: 'Is temporary user(create temp customers)'
      t.references :role, :polymorphic => true,     comment: 'User role - admin, manager or customer'

      # Devise
      t.string    :authentication_token,             comment: 'Auth by token'
      t.datetime  :remember_created_at,              comment: 'Remember me'

      t.string    :reset_password_token,             comment: 'Token for reseting password'
      t.string    :reset_password_code,              comment: 'Sms with code for reset'
      t.datetime  :reset_password_sent_at,           comment: 'When token created'

      t.timestamps
    end

    # Indexes
    add_index :sap_users, :id
    add_index :sap_users, :login,                 :unique => true
    add_index :sap_users, :email,                 :unique => true
    add_index :sap_users, :authentication_token,  :unique => true
  end
end
