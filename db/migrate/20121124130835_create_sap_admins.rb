# -------------------------------------------------------------
# GloboMarket's administrator table
# -------------------------------------------------------------
class CreateSapAdmins < ActiveRecord::Migration
	def change
		create_table :"sap.admins" do |t|
			t.integer :city_id
			t.string :name, null:false
			t.string :position

			t.timestamps
		end
	end
end
