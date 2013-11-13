## encoding: UTF-8
require File.expand_path('../../app/models/sap', __FILE__)

## Clear DB
Sap::OrderItem.delete_all
Sap::Order.delete_all
Sap::GoodItem.delete_all
Sap::Good.delete_all

Sap::Store.delete_all
Sap::Region.delete_all

Sap::Category.delete_all
Sap::CategoryGood.delete_all

Sap::User.delete_all
Sap::Admin.delete_all
Sap::Manager.delete_all


# Regions
Sap::Region.delete_all
Sap::Region.create([
    {id:1, name: 'Москва',  description: 'Работа идет полным ходом'},
    {id:2, name: 'Киев',    description: 'Пока в планах'}
])

# Stores
Sap::Store.create([
		#{id:1,name: 'GloboMarket', is_disabled: false, order_pos: 1, region_id: 1},
		{id:2,  name: 'Азбука Вкуса', order_pos: 2, url: 'azbuka-vkusa',  region_id: 1, system_name: 'azbuka'},
		{id:3,  name: 'Аллые Паруса', order_pos: 3, url: 'allie-parusa',  region_id: 1, system_name: 'parusa'},
		{id:4,  name: 'Глобус Гурме', order_pos: 4, url: 'globus-gurme',  region_id: 1, system_name: 'globus'},
    {id:5,  name: 'Перекресток',  order_pos: 5, url: 'perekrestok',   region_id: 1, system_name: 'perekrestok'},
])

# Categories
Sap::Category.create([
    {id:1, name: 'Алкогольные напитки', url: 'alcohol'},
      {id:2, name: 'Пиво',                url: 'bear',                  parent_id: 1},
      {id:3, name: 'Вино',                url: 'wine',                  parent_id: 1},
      {id:4, name: 'Крепкие напитки',     url: 'strong',                parent_id: 1},
    {id:5, name: 'Овощи и Фрукты',      url: 'vegetables-and-fruits'},
      {id:6, name: 'Овощи',               url: 'vegetables',            parent_id: 5},
      {id:7, name: 'Фрукты',              url: 'fruits',                parent_id: 5},
      {id:8, name: 'Орехи',               url: 'nuts',                  parent_id: 5},
      {id:9, name: 'Сухофрукты',          url: 'dried-fruit',           parent_id: 5},
    {id:10,name: 'Мясо и Рыба',         url: 'meat-and-fish'},
      {id:11,name: 'Колбаса и соиски',    url: 'sausages',              parent_id: 10},
      {id:12,name: 'Рыба и море пр-кты',  url: 'sea-foods',             parent_id: 10},
      {id:13,name: 'Икра',                url: 'caviar',                parent_id: 10},
      {id:14,name: 'Мясные закуски',      url: 'meat',                  parent_id: 10},
    {id:15,name: 'Сладкое',             url: 'sweets'},
      {id:16,name: 'Шоколад',             url: 'chokolate',             parent_id: 15},
      {id:17,name: 'Конфеты',             url: 'candy',                 parent_id: 15},
    {id:20,name: 'Молочные',            url: 'milky'},
      {id:21,name: 'Молоко',              url: 'milk',                  parent_id: 20},
      {id:22,name: 'Кисло-Молочные',      url: 'kislomilk',             parent_id: 20},

])

# Goods
Sap::Good.create([
    {id:1, name:'Сникерс 100г.',            description: 'Не тормози - сникерсНИ',  value: 1,     measure_id: 3},
    {id:2, name:'Марс 100г.',               description: 'Попробывав раз',          value: 1,     measure_id: 3},
    {id:3, name:'Твикс.',                   description: 'Тогда мыы идем к Вам',    value: 1,     measure_id: 3},
    {id:18,name:'Конфеты "Мишка", 1кг',     description: 'Мишка на дереве',         value: 1000,  measure_id: 1},

    {id:4, name:'Пиво клинское, 0.5л',      description: 'Пиво клинское',           value: 1,     measure_id: 3},
    {id:5, name:'Пиво Балтика 9, 0.5л',     description: 'Пиво клинское',           value: 1,     measure_id: 3},
    {id:6, name:'Вино белое "Фр. з-к" 1л.', description: 'Тогда мыы идем к Вам',    value: 1,     measure_id: 3},
    {id:7, name:'Водка столичная 0.5л',     description: 'Водка столичная',         value: 1,     measure_id: 3},
    {id:8, name:'Виски Джек Дениелс, 1л.',  description: 'Тогда мыы идем к Вам',    value: 1,     measure_id: 3},
    {id:13,name:'Абсент, 1л.',              description: 'Тогда мыы идем к Вам',    value: 1,     measure_id: 3},
    {id:14,name:'Мартини, 1л.',             description: 'Тогда мыы идем к Вам',    value: 1,     measure_id: 3},
    {id:15,name:'Ром Кубинский, 1л.',       description: 'Тогда мыы идем к Вам',    value: 1,     measure_id: 3},
    {id:16,name:'Коктель отвертка, 1л.',    description: 'Тогда мыы идем к Вам',    value: 1,     measure_id: 3},
    {id:17,name:'Ягуар, 0.5л.',             description: 'Тогда мыы идем к Вам',    value: 1,     measure_id: 3},

    {id:9, name:'Молоко п-вашино 3.5%, 1л', description: 'Молочко',                 value: 1,     measure_id: 3},
    {id:10,name:'Молоко п-вашино 1.5%, 1л', description: 'Молочко',                 value: 1,     measure_id: 3},
    {id:11,name:'Молоко п-вашино 0.5%, 1л', description: 'Молочко',                 value: 1,     measure_id: 3},
    {id:12,name:'Молоко п-вашино т-e, 1л',  description: 'Молочко',                 value: 1,     measure_id: 3},
    {id:19,name:'Творог, 1кг',              description: 'Творог',                  value: 500,   measure_id: 1},


])
#connection.execute('ALTER SEQUENCE sap_goods_id_seq MINVALUE 10000 START 10000 RESTART 10000;')

# Good -> Category
Sap::CategoryGood.create([
  # Sweets
  {category_id:15,good_id:1},
  {category_id:16,good_id:1},
  {category_id:15,good_id:2},
  {category_id:16,good_id:2},
  {category_id:15,good_id:3},
  {category_id:16,good_id:3},
  {category_id:15,good_id:18},
  {category_id:17,good_id:18},

  # Alcohol
  {category_id:1, good_id:4},
  {category_id:2, good_id:4},
  {category_id:1, good_id:5},
  {category_id:2, good_id:5},
  {category_id:1, good_id:6},
  {category_id:3, good_id:6},
  {category_id:1, good_id:7},
  {category_id:4, good_id:7},
  {category_id:1, good_id:8},
  {category_id:4, good_id:8},
  {category_id:1, good_id:13},
  {category_id:4, good_id:13},
  {category_id:1, good_id:14},
  {category_id:4, good_id:14},
  {category_id:1, good_id:15},
  {category_id:4, good_id:15},
  {category_id:1, good_id:16},
  {category_id:4, good_id:16},
  {category_id:1, good_id:17},
  {category_id:4, good_id:17},

  # Milk
  {category_id:20, good_id:9},
  {category_id:21, good_id:9},
  {category_id:20, good_id:10},
  {category_id:21, good_id:10},
  {category_id:20, good_id:11},
  {category_id:21, good_id:11},
  {category_id:20, good_id:12},
  {category_id:21, good_id:12},
  {category_id:20, good_id:19},
  {category_id:22, good_id:19},

])

# GoodLists
Sap::GoodItem.create([
  # Azbuka Vkusa
    {good_id: 1,  price: 30.00, store_id: 2, store_gid: 1},
    {good_id: 2,  price: 29.80, store_id: 2, store_gid: 2},
    {good_id: 3,  price: 31.50, store_id: 2, store_gid: 3},
    {good_id: 4,  price: 50.00, store_id: 2, store_gid: 4},
    {good_id: 5,  price: 60.00, store_id: 2, store_gid: 5},
    {good_id: 6,  price: 550.0, store_id: 2, store_gid: 6},
    {good_id: 7,  price: 250.0, store_id: 2, store_gid: 7},
    {good_id: 8,  price: 900.0, store_id: 2, store_gid: 8},
    {good_id: 9,  price: 37.00, store_id: 2, store_gid: 9},
    {good_id: 10, price: 36.00, store_id: 2, store_gid: 10},
    {good_id: 11, price: 33.50, store_id: 2, store_gid: 11},
    {good_id: 12, price: 35.00, store_id: 2, store_gid: 12},
    {good_id: 13, price: 850.0, store_id: 2, store_gid: 13},
    {good_id: 14, price: 500.0, store_id: 2, store_gid: 14},
    {good_id: 15, price: 990.0, store_id: 2, store_gid: 15},
    {good_id: 16, price: 150.0, store_id: 2, store_gid: 16},
    {good_id: 17, price: 50.00, store_id: 2, store_gid: 17},
    {good_id: 18, price: 250.0, store_id: 2, store_gid: 18},
    {good_id: 19, price: 90.00, store_id: 2, store_gid: 19},

  # Allye Parusa
    {good_id: 1,  price: 31.00, store_id: 3, store_gid: 111},
    {good_id: 2,  price: 29.80, store_id: 3, store_gid: 112},
    {good_id: 3,  price: 35.50, store_id: 3, store_gid: 113},
    {good_id: 4,  price: 54.00, store_id: 3, store_gid: 114},
    {good_id: 5,  price: 61.00, store_id: 3, store_gid: 115},
    {good_id: 6,  price: 559.0, store_id: 3, store_gid: 116},
    {good_id: 7,  price: 251.0, store_id: 3, store_gid: 117},
    {good_id: 8,  price: 700.0, store_id: 3, store_gid: 118},
    {good_id: 9,  price: 47.00, store_id: 3, store_gid: 119},
    {good_id: 10, price: 46.00, store_id: 3, store_gid: 110},
    {good_id: 11, price: 43.50, store_id: 3, store_gid: 1111},
    {good_id: 12, price: 45.00, store_id: 3, store_gid: 1112},
    {good_id: 13, price: 950.0, store_id: 3, store_gid: 1113},
    {good_id: 14, price: 600.0, store_id: 3, store_gid: 1114},
    {good_id: 15, price: 900.0, store_id: 3, store_gid: 1115},
    {good_id: 16, price: 170.0, store_id: 3, store_gid: 1116},
    {good_id: 17, price: 55.00, store_id: 3, store_gid: 1117},
    {good_id: 18, price: 230.0, store_id: 3, store_gid: 1118},
    {good_id: 19, price: 91.00, store_id: 3, store_gid: 1119},
])

#------------------------------------------------------------------------------
# Create users
#------------------------------------------------------------------------------

# Customer
#Sap::Customer.delete_all
#customer = Sap::Customer.new do |c|
#
#  # Create user
#  c.user = Sap::User.new do |user|
#
#    # Email is login for customer
#    user.login = 'user'
#    user.name  = c.first_name = c.last_name = 'Пользователь'
#
#    # Set Random password and Salt
#    user.password = user.hash_password('user')
#
#    user.token = Digest::SHA1.hexdigest( user.name + user.salt + user.password )
#  end
#  c.phone = '02020202021'
#end
#customer.save!

# Admin
#admin = Sap::Admin.new do |a|
#
#  # Create user
#  a.user = Sap::User.new do |user|
#
#    # Email is login for customer
#    user.login = 'admin'
#    user.name  = 'Администратор'
#
#    # Set Random password and Salt
#    user.salt = 'qwe123'
#    user.password = user.hash_password('admin')
#
#    user.token = Digest::SHA1.hexdigest( user.name + user.salt + user.password )
#  end
#  a.name = 'Админитратор'
#end
#admin.save!

# Manager
#manager = Sap::Manager.new do |m|
#
#  # Create user
#  m.user = Sap::User.new do |user|
#
#    # Email is login for customer
#    user.login = 'manager'
#    user.name  = 'Менаджер'
#    # Set Random password and Salt
#    user.salt = '123asd'
#    user.password = user.hash_password('manager')
#
#    user.token = Digest::SHA1.hexdigest( user.name + user.salt + user.password )
#  end
#  m.store_id = 2 # Azbuka Vkusa
#  m.last_name = 'Ivanov'
#  m.first_name = 'Denis'
#end
#manager.save!


# Order
Sap::Order.create(id:1, state: Sap::Order::ST_NEW, hash_str: 'uy23ed' )
Sap::OrderItem.create([
    {id: 1, order_id: 1, value: 1900, good_item_id:18},
    {id: 2, order_id: 1, value: 3500, good_item_id:19},
    {id: 3, order_id: 1, value: 10,   good_item_id:1},
    {id: 4, order_id: 1, value: 5,    good_item_id:8},
    {id: 5, order_id: 1, value: 5,    good_item_id:9},
  ])
