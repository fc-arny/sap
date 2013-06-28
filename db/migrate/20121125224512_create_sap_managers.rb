# -------------------------------------------------------------
# Store's manager tagle
# -------------------------------------------------------------
class CreateSapManagers < ActiveRecord::Migration
	def change
		create_table :"sap.managers" do |t|
			t.integer :store_id, null:false
			t.integer :last_name, null:false
			t.integer :first_name, null:false

			t.timestamps
		end
  end
end
