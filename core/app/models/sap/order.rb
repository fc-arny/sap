# == Schema Information
#
# Table name: sp_orders
#
#  id         :integer          not null, primary key
#  state      :string(255)      not null
#  hash_str   :string(255)      not null
#  sum        :integer
#  user_id    :integer
#  phone      :string(255)
#  address    :string(255)
#  comment    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Sap::Order < ActiveRecord::Base
  # TODO: Обдумать статусы заказа
  # Order states
  # ST_NEW       = 'new'
  # ST_PAID      = 'paid'
  # ST_PACK      = 'pack'
  # ST_DELIVERY   = 'delivery'
  # ST_FINISHED  = 'finished'

  # Fields
  #attr_accessible :id, :state, :sum, :user_id, :hash_str, :created_at, :updated_at

  # Relationships
  has_many :order_items, :class_name => 'Sap::OrderItem'


  class << self
    # -------------------------------------------------------------
    # Fetch order by id and hash
    # Hash has the format: ID + 'x' + HASH_STR
    # -------------------------------------------------------------
    def get_by_hash(hash)
      id, hash_str = hash.split(/x/,2)
      self.where(
          'id = :id AND hash_str = :hash_str',
          {:id => id, :hash_str => hash_str}
      ).first
    end
  end

  def as_json(options={})

    # Good's settings
    good_setting = [
        :good => {:only => [:id, :name]}
    ]

    # GoodItem's settings
    good_item_setting = [
        :good_item => {
            :only => [:id,:price,:store_id],
            :include => good_setting
        }
    ]

    # OrderItem's settings
    order_item_setting = [
        :order_items => {
            :only => [:id, :count],
            :include => good_item_setting
        }
    ]

    order = super(options.merge( :include => order_item_setting ))
  end
end
