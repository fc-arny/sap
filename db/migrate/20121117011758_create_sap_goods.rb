# -------------------------------------------------------------
# Create table for goods
# -------------------------------------------------------------
class CreateSapGoods < ActiveRecord::Migration
	def change
		create_table :"sap.goods" do |t|
			t.integer :id
			t.string :name, null: false
      t.integer :measure_id, null: false
      t.integer :measure_value, null: false
      t.integer :measure_step, null: false, default: 1
			t.text :description
			t.boolean :is_approved, default: false
			t.integer :order_por, default: 0

			t.timestamps
		end
	end
end
