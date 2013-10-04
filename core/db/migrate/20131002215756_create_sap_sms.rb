class CreateSapSms < ActiveRecord::Migration
  def change
    create_table :sap_sms do |t|
      t.integer :number
      t.string :message
      t.datetime :created
      t.string :provider

      t.timestamps
    end
  end
end
