class CreateIndexes < ActiveRecord::Migration
  def change
    # Region
    add_foreign_key :sap_regions, :sap_regions, column: :parent_id

    # Store
    add_foreign_key :sap_stores, :sap_regions, column: :region_id

    # Category
    add_index :sap_categories, :ancestry
    add_index :sap_categories, :images_id
    add_index :sap_category_goods, [:category_id, :good_id], unique: true
    add_foreign_key(:sap_categories, :image_thread_threads, column: :images_id)

    # Measures
    add_foreign_key :sap_measures, :sap_measures, column: :parent_id
    add_foreign_key :sap_goods, :sap_measures, column: :measure_id

    # Goods
    add_foreign_key :sap_goods, :sap_categories, column: :category_id
    add_foreign_key :sap_goods, :sap_goods, column: :group_id
  end
end