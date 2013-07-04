# -------------------------------------------------------------
# SAP's administrator table
# -------------------------------------------------------------
class CreateSapAdmins < ActiveRecord::Migration
	def change
		create_table :sap_admins, comment: 'Admin users' do |t|
			t.string :name, null:false,   comment: 'Admin name'
			t.string :position,           comment: 'Position in company(ex.: CEO, CTO, CFO)'

			t.timestamps
    end

    # Indexes
    add_index :sap_admins, :id
	end
end
