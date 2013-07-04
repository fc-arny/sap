# -------------------------------------------------------------
# Create table for goods
# -------------------------------------------------------------
class CreateSapGoodsCategories < ActiveRecord::Migration
	def change

    # Create goods table
		create_table :sap_goods, comment: 'All goods from all stores' do |t|

			t.string  :name, null: false,             comment: 'Goods name'
			t.text    :description,                   comment: 'Goods\'s description'
			t.boolean :is_approved, default: true,    comment: 'Is good blocked by admin'
			t.integer :order_pos, default: 0,         comment: 'Sorting value'

      t.integer :measure_id, null: false
      t.integer :measure_value, null: false
      t.integer :measure_step, null: false, default: 1
			t.timestamps
    end

    # Create category table
    create_table :sap_categories, comment: 'Goods categories' do |t|

      t.string  :name, null: false,         comment: 'Category name'
      t.string  :url, null: false,          comment: 'Category url segment'
      t.integer :order_pos, default: 0,     comment: 'Sorting value'
      t.integer :parent_id, default: nil,   comment: 'Parent category'

      t.timestamps

    end

    # Intervening table
    create_table :sap_category_good, comment: 'Intervening table' do |t|
      t.belongs_to :category
      t.belongs_to :good
    end

    # Parent category
    add_foreign_key :sap_categories, :sap_categories, :column => :parent_id

    # Indexes for categories table
    add_index :sap_categories, :id
    add_index :sap_categories, :order_pos

    # Indexes for goods table
    add_index :sap_goods, :id
    add_index :sap_goods, :order_pos
	end
end
