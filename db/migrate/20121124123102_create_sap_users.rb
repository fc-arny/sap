# -------------------------------------------------------------
# Base table for users
# -------------------------------------------------------------

class CreateSapUsers < ActiveRecord::Migration
  def change
    create_table :"sap.users" do |t|
      t.integer :id
      t.string :login, null:false, comment: 'secret key = md5(md5(password) + salt)'
      t.string :password, null:false
      t.string :salt, null:false
      t.boolean :is_temporary, default: false

      t.string :token
      t.datetime :valid_token_to

      t.references :role, :polymorphic => true

      t.timestamps
    end
  end
end
