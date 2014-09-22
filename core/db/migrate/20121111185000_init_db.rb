# -------------------------------------------------------------
# Init migration
# -------------------------------------------------------------
class InitDb < ActiveRecord::Migration
  def change
    # Regions table
    create_table :sap_regions, comment: 'Regions.ex Moscow(child: Reutov, Rublevo, Lyubertsy etc)' do |t|

      t.string  :name, null: false,         comment: 'Region name'
      t.string  :description,               comment: 'Description for region'
      t.integer :parent_id, default: nil,   comment: 'Big region can have smaller subregions'
      t.timestamps
    end

    # Create table for store
    create_table :sap_stores do |t|
      t.string      :name, null: false,     comment: 'Store\'s name'
      t.integer     :position, default: 0,  comment: 'Value for sorting stores'
      t.string      :url, null: false,      comment: 'Url segment'
      t.string      :system_name,           comment: 'Internal name of store'
      t.boolean     :active, default: false,comment: 'Work with this store or not'
      t.references  :region,                comment: 'Link to region'
      t.time        :work_time_from,        comment: 'Store start work'
      t.time        :work_time_to,          comment: 'Store stop work'
      t.timestamps
    end

    # Measures
    create_table :sap_measures do |t|
      t.string  :name, null: false                   # Unit short name
      t.string  :sys_name, null: false               # Unit full name
    end

    # Create category table
    create_table :sap_categories, comment: 'Goods categories' do |t|
      t.string  :name, null: false,           comment: 'Category name'
      t.string  :url, null: false,            comment: 'Category url segment'
      t.integer :position, default: 0,        comment: 'Sorting value'
      t.boolean :show_in_menu, default: true, comment: 'Category like tag. If show_in menu os true'
      t.integer :images_id,                   comment: 'Reference to images\' album'
      t.string  :ancestry,                    comment: 'Ancestry gem\'s field for TREE view'

      t.timestamps
    end

    # Create goods table
    create_table :sap_goods, comment: 'All goods from all stores' do |t|

      t.string  :name, null: false,             comment: 'Goods name'
      t.text    :description,                   comment: 'Goods\'s description'

      t.integer :value, null: false,            comment: 'How many gram or priece in one item'
      t.references :measure,                    comment: 'Good\'s measure: kilo, pack, bar etc'
      t.references :category,                   comment: 'Good\'s category'

      t.boolean :is_group, default: false,      comment: 'Group of same product in defferent packs'
      t.integer :group_id, default: nil,        comment: 'Reference to group'
      t.references :image_thread,                comment: 'Reference to images\' album'

      t.timestamps
    end

    # Joining table
    create_table :sap_category_goods, id: false, comment: 'Joining table' do |t|
      t.references :category
      t.references :good
    end

    # Base table for users
    create_table :sap_users, comment: 'Base model for all users' do |t|
      t.string     :name,                           comment: 'All users should have name. Generated name'
      t.string     :login, null:false,              comment: 'User login'
      t.string     :email,                          comment: 'User email'
      t.string     :phone, :null => false,          comment: 'Customer phone'
      t.string     :role,                           comment: 'User role in backend'
      t.string     :encrypted_password, null:false, comment: 'Password hash'
      t.boolean    :is_temporary, default: false,   comment: 'Is temporary user(create temp customers)'

      # Devise
      t.string    :authentication_token,             comment: 'Auth by token'
      t.datetime  :remember_created_at,              comment: 'Remember me'

      t.string    :reset_password_token,             comment: 'Token for reseting password'
      t.string    :reset_password_code,              comment: 'Sms with code for reset'
      t.datetime  :reset_password_sent_at,           comment: 'When token created'

      t.string    :reset_phone_new,               comment: 'New user phone'
      t.string    :reset_phone_code,              comment: 'Code sent by sms'
      t.datetime  :reset_phone_sent_at,           comment: 'When code created'

      t.timestamps
    end

    # Goods of store
    create_table :sap_good_items, comment: 'Goods of store' do |t|

      t.references :good, null: false,                    comment: 'Real good ID'
      t.string     :store_gid, null: false,               comment: 'Store inside good\'s ID for sync list'
      t.decimal    :price, null: false, precision: 8, scale: 2,  comment: 'Price in the store'
      t.references :store, null: false,                   comment: 'Store ID'
      t.boolean    :is_available, default: true,          comment: 'Does store have this good'
      t.integer    :position, default: nil,               comment: 'Sorting value'
      t.references :image_thread,                         comment: 'Reference to images\' album'
      t.timestamps
    end

    # TODO: create vendor model
    create_table 'sap_vendors' do |t|

      t.string :name

      t.timestamps
    end

    # Addressees for any entire
    create_table :sap_addresses, comment: 'Addresses table' do |t|
      t.string      :name,                        comment: 'Address title.Ex.: home, office, manny etc'
      t.string      :street, null: false,         comment: 'Street, house number etc'
      t.string      :comment,                     comment: 'More information for courier'
      t.references  :region, null:false,          comment: 'Link to region. Ex.: Moscow'
      t.references  :owner, polymorphic: true,    comment: 'Store or user or everything link'

      t.timestamps
    end

    # Orders model
    create_table :sap_orders, comment: 'Order model' do |t|
      t.string :state, null: false,     comment: 'Order state - new, payed etc'
      t.string :hash_str, null: false,  comment: 'Hash for order access'
      t.decimal :sum, precision: 8, scale: 2
      t.integer :user_id,               comment: 'Customer.user_id - link to user'
      t.string :phone,                  comment: 'Phone string'
      t.string :address,                comment: 'Address string'
      t.string :comment,                comment: 'Order comment'

      t.date    :delivery_date,         comment: 'Delivery date'
      t.string  :delivery_interval,     comment: 'Delivery time interval(ex.: 18:00-01:00)'
      t.decimal :delivery_price, precision: 8, scale: 2, comment: 'Price for delivery'

      t.timestamps
    end

    # GoodList of order
    create_table :sap_order_items, comment: 'GoodList of order' do |t|

      t.references :order, null: false,                       comment: 'Order ID'
      t.references :good_item, null: false,                   comment: 'Good(item) ID'
      t.integer    :value, null: false,                       comment: 'Good value. Ex.: 100 packs or 1500 gram'
      t.decimal    :price, precision: 8, scale: 2,            comment: 'Current price for product'

      t.timestamps
    end

    # Sms, status, date
    create_table 'sap_sms' do |t|
      t.integer :number
      t.string :message
      t.datetime :created
      t.string :provider

      t.timestamps
    end

    # Blog

    create_table :'sap_blog_categories', comment: 'Blog categories' do |t|
      t.string :name, null: false
      t.string :url, null: false

      t.timestamps
    end

    add_index :'sap_blog_categories', :url, unique: true

    create_table :'sap_blog_posts', comment: 'Blog posts' do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.references :category

      t.boolean :published, default: false,   comment: 'Show or not this post in the feed'
      t.datetime :published_date,             comment: 'Posted date for users'

      t.timestamps
    end

    add_foreign_key 'sap_blog_posts', 'sap_blog_categories', :column => :category_id
  end
end
