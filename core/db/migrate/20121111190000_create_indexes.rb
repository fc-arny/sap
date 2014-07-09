class CreateIndexes < ActiveRecord::Migration
  def change
    # Addresses
    add_foreign_key :sap_addresses, :sap_regions, column: :region_id

    # Category
    add_index :sap_categories, :ancestry
    add_index :sap_categories, :images_id
    add_index :sap_category_goods, [:category_id, :good_id], unique: true
    add_foreign_key(:sap_categories, :image_thread_threads, column: :images_id)

    # Goods
    add_foreign_key :sap_goods, :sap_categories, column: :category_id
    add_foreign_key :sap_goods, :sap_goods, column: :group_id

    add_foreign_key :sap_good_items, :sap_goods,  column: :good_id
    add_foreign_key :sap_good_items, :sap_stores, column: :store_id

    add_index :sap_good_items, :store_id
    add_index :sap_good_items, :good_id
    add_index :sap_good_items, [:store_gid, :store_id], unique: true

    # Measures
    add_foreign_key :sap_measures, :sap_measures, column: :parent_id
    add_foreign_key :sap_goods, :sap_measures, column: :measure_id

    # Order
    add_foreign_key :sap_orders, :sap_users, column: :user_id

    add_foreign_key :sap_order_items, :sap_orders, column: :order_id
    add_foreign_key :sap_order_items, :sap_good_items, column: :good_item_id

    add_index :sap_order_items, [:order_id, :good_item_id], unique: true
    add_index :sap_order_items, :order_id


    # Region
    add_foreign_key :sap_regions, :sap_regions, column: :parent_id

    # Store
    add_foreign_key :sap_stores, :sap_regions, column: :region_id

    # Users
    add_index :sap_users, :login,                 unique: true
    add_index :sap_users, :email,                 unique: true
    add_index :sap_users, :authentication_token,  unique: true
    add_index :sap_users, :phone,                 unique: true
  end
end