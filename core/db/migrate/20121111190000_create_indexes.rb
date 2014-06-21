class InitDb < ActiveRecord::Migration
  def change
    # Region
    add_foreign_key :sp_regions, :sp_regions, column: :parent_id

    # Store
    add_foreign_key :sp_stores, :sp_regions, column: :region_id

    # Category
    add_index :sp_categories, :ancestry
    add_index :sp_categories, :images_id
    add_index :sp_category_goods, [:category_id, :good_id], unique: true
    add_foreign_key(:sp_categories, :image_thread_threads, column: :images_id)

    # Measures
    add_foreign_key :sp_measures, :sp_measures, column: :parent_id
    add_foreign_key :sp_goods, :sp_measures, column: :measure_id

    # Goods
    add_foreign_key :sp_goods, :sp_categories, column: :category_id
    add_foreign_key :sp_goods, :sp_goods, column: :group_id
  end
end