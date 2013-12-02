# -------------------------------------------------------------
# Init migration
# -------------------------------------------------------------
class InitDb < ActiveRecord::Migration
  def change
    # Regions table
    create_table :'sap.regions', comment: 'Regions.ex Moscow(chld: Reutov, Rublevo, Lyubertsy etc)' do |t|

      t.string  :name, null: false,         comment: 'Region name'
      t.string  :description,               comment: 'Description for region'
      t.integer :parent_id, default: nil,   comment: 'Big region can have smaller subregions'
      t.timestamps
    end

    # Parent region
    add_foreign_key :'sap.regions', :'sap.regions', :column => :parent_id

    # Create table for store
    create_table :'sap.stores' do |t|
      t.string      :name, null: false,     comment: 'Store\'s name'
      t.integer     :order_pos, default: 0, comment: 'Value for sorting stores'
      t.string      :url, null: false,      comment: 'Url segment'
      t.string      :system_name,           comment: 'Internal name of store'
      t.boolean     :active, default: false,comment: 'Work with this store or not'
      t.references  :region,                comment: 'Link to region'
      t.time        :work_time_from,        comment: 'Store start work'
      t.time        :work_time_to,          comment: 'Store stop work'
      t.timestamps
    end

    # Foreign keys
    add_foreign_key 'sap.stores', 'sap.regions', :column => :region_id

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
    add_index :'sap.category_goods', [:category_id, :good_id], :unique => true

    # Base table for users
    create_table :'sap.users', :comment => 'Base model for all users' do |t|
      t.string     :name,                           comment: 'All users should have name. Generated name'
      t.string     :login, null:false,              comment: 'User login'
      t.string     :email,                          comment: 'User email'
      t.string     :phone, :null => false,          comment: 'Customer phone'
      t.string     :encrypted_password, null:false, comment: 'Password hash'
      t.boolean    :is_temporary, default: false,   comment: 'Is temporary user(create temp customers)'

      # Devise
      t.string    :authentication_token,             comment: 'Auth by token'
      t.datetime  :remember_created_at,              comment: 'Remember me'

      t.string    :reset_password_token,             comment: 'Token for reseting password'
      t.string    :reset_password_code,              comment: 'Sms with code for reset'
      t.datetime  :reset_password_sent_at,           comment: 'When token created'

      t.timestamps
    end

    # Indexes
    add_index :'sap.users', :login,                 :unique => true
    add_index :'sap.users', :email,                 :unique => true
    add_index :'sap.users', :authentication_token,  :unique => true
    add_index :'sap.users', :phone,                 :unique => true



    # Goods of store
    create_table 'sap.good_items', comment: 'Goods of store' do |t|

      t.references :good, null: false,                    comment: 'Real good ID'
      t.string     :store_gid, null: false,               comment: 'Store inside good\'s ID for sync list'
      t.decimal    :price, null: false, precision: 8, scale: 2,  comment: 'Price in the store'
      t.references :store, null: false,                   comment: 'Store ID'
      t.boolean    :is_available, default: true,          comment: 'Does store have this good'
      t.integer    :order_pos, default: nil,              content: 'Sorting value'

      t.timestamps
    end

    # Indexes
    add_index 'sap.good_items', :store_id
    add_index 'sap.good_items', :good_id
    add_index 'sap.good_items', [:store_gid, :store_id], :unique => true

    # Foreign keys
    add_foreign_key 'sap.good_items', 'sap.goods',  :column => :good_id
    add_foreign_key 'sap.good_items', 'sap.stores', :column => :store_id

    # TODO: create vendor model
    create_table 'sap.vendors' do |t|

      t.string :name

      t.timestamps
    end

    # Addressees for any entire
    create_table 'sap.addresses', comment: 'Addresses table' do |t|

      t.string      :name,                        comment: 'Address title.Ex.: home, offece, manny etc'
      t.string      :street, null: false,         comment: 'Street, house number etc'
      t.string      :comment,                     comment: 'More information for courier'
      t.references  :region, null:false,          comment: 'Link to region. Ex.: Moscow'
      t.references  :owner, :polymorphic => true, comment: 'Store or user or everything link'

      t.timestamps
    end

    # Foreign keys
    add_foreign_key 'sap.addresses', 'sap.regions', :column => :region_id


    # Orders model
    create_table 'sap.orders', comment: 'Order model' do |t|

      t.string :state, null: false,     comment: 'Order state - new, payed etc'
      t.string :hash_str, null: false,  comment: 'Hash for order access'
      t.decimal :sum, :precision => 2
      t.integer :user_id,               comment: 'Customer.user_id - link to user'
      t.string :phone,                  comment: 'Phone string'
      t.string :address,                comment: 'Address string'
      t.string :comment,                comment: 'Order comment'
      t.timestamps
    end

    # Indexes

    # Foreign keys
    add_foreign_key 'sap.orders', 'sap.users', :column => :user_id

    # GoodList of order
    create_table 'sap.order_items', :id => false, :comment => 'GoodList of order' do |t|

      t.references :order, null: false,                       comment: 'Order ID'
      t.references :good_item, null: false,                   comment: 'Good(item) ID'
      t.integer    :value, null: false,                       comment: 'Good value. Ex.: 100 packs or 1500 gram'
      t.decimal    :price, precision: 8, scale: 2,            comment: 'Current price for product'

      t.timestamps
    end

    # Indexes
    add_index 'sap.order_items', [:order_id, :good_item_id], :unique => true
    add_index 'sap.order_items', :order_id

    # Foreign keys
    add_foreign_key 'sap.order_items', 'sap.orders', :column => :order_id
    add_foreign_key 'sap.order_items', 'sap.good_items',  :column => :good_item_id


    create_table 'sap.measures' do |t|
      t.string  :name, null: false
      t.integer :step, null: false
      t.integer :value_in_parent
      t.integer :parent_id
    end

    add_foreign_key 'sap.measures', 'sap.measures', column: :parent_id
    add_foreign_key 'sap.goods', 'sap.measures', column: :measure_id

    Sap::Measure.create :id => 1, :name => 'gram', :step => 100
    Sap::Measure.create :id => 3, :name => 'piece', :step => 1

    # Sms, status, date
    create_table 'sap.sms' do |t|
      t.integer :number
      t.string :message
      t.datetime :created
      t.string :provider

      t.timestamps
    end
  end
end
