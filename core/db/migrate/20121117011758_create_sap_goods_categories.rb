# -------------------------------------------------------------
# Create table for goods
# -------------------------------------------------------------
class CreateSapGoodsCategories < ActiveRecord::Migration
	def change

    # Create goods table
    create_table :'sap.goods', comment: 'All goods from all stores' do |t|

      t.string  :name, null: false,             comment: 'Goods name'
      t.text    :description,                   comment: 'Goods\'s description'

      t.integer :value, null: false,            comment: 'How many gram or priece in one item'
      t.references :measure,                    comment: 'Good\'s measure: kilo, pack, bar etc'

      t.boolean :is_approved, default: true,    comment: 'Is good blocked by admin'
      t.boolean :is_group, default: false,      comment: 'Group of same product in defferent packs'

      t.integer :group_id, default: nil,       comment: 'Reference to group'

      t.timestamps
    end

    # Create category table
    create_table :'sap.categories', comment: 'Goods categories' do |t|

      t.string  :name, null: false,         comment: 'Category name'
      t.string  :url, null: false,          comment: 'Category url segment'
      t.integer :order_pos, default: 0,     comment: 'Sorting value'
      t.boolean :show_in_menu, default: true, comment: 'Category like tag. If show_in menu os true'
      t.integer :parent_id, default: nil,   comment: 'Parent category'

      t.timestamps

    end

    # Joining table
    create_table :'sap.category_goods', id: false, comment: 'Joining table' do |t|
      t.references :category
      t.references :good
    end

    # Parent category
    add_foreign_key :'sap.goods', :'sap.goods', :column => :group_id
    add_foreign_key :'sap.categories', :'sap.categories', :column => :parent_id

    # Joining table
    add_index :'sap.category_good', [:category_id, :good_id], :unique => true
	end
end
