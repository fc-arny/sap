class CreateSapOrders < ActiveRecord::Migration
  def change
    create_table :'sap.orders' do |t|
      t.integer :id
      t.string :state
      t.string :hash_str
      t.decimal :sum
      t.integer :user_id
      t.integer :phone_id, comment: 'Link to phone'
      t.string :address, comment: 'Address string: area, street, house number and etc'

      t.timestamps
    end
  end
end
