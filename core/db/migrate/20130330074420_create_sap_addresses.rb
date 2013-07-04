# -------------------------------------------------------------
# Addressees for any entire
# -------------------------------------------------------------
class CreateSapAddresses < ActiveRecord::Migration
  def change
    create_table :sap_addresses, comment: 'Addresses table' do |t|

      t.references  :region, null:false,          comment: 'Link to region. Ex.: Moscow'
      t.string      :street, null: false,         comment: 'Street, house number etc'
      t.string      :title,                       comment: 'Address title.Ex.: home, offece, manny etc'
      t.string      :comment,                     comment: 'More information for courier'
      t.references  :owner, :polymorphic => true, comment: 'Store or user link'

      t.timestamps
    end

    # Indexes
    add_index :sap_addresses, :id

    # Foreign keys
    add_foreign_key :sap_addresses, :sap_regions, :column => :region_id
  end
end
