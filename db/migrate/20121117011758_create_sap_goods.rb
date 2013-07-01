# -------------------------------------------------------------
# Create table for goods
# -------------------------------------------------------------
class CreateSapGoods < ActiveRecord::Migration
	def change
		create_table :sap_goods do |t|

			t.string :name, null: false
      t.integer :measure_id, null: false
      t.integer :measure_value, null: false
      t.integer :measure_step, null: false, default: 1
			t.text :description
			t.boolean :is_approved, default: false
			t.integer :order_pos, default: 0

			t.timestamps
		end
	end
end
