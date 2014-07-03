# == Schema Information
#
# Table name: sap_orders
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
# ============================
class Sap::Order < Sap::Base
  include AASM

  has_many :order_items, class_name: Sap::OrderItem.to_s


  aasm column: :state do
    state :new, initial: true
    state :issued
    state :paid
    state :processing
    state :closed
    state :canceled

    all = states.map(&:name)

    event :cancel do
      transitions from: all - [:cancel], to: :canceled
    end

    event :issue do
      transitions from: [:new], to: :issued
    end

    event :payment do
      transitions from: [:executed], to: :paid
    end

    event :close do
      transitions fromm: :processing, to: :closed
    end

    event :process do
      transitions from: [:issued, :paid], to: :closed
    end
    #              | new         | issued      | paid        | processing  | closed      | canceled    |
    #  ----------- * ----------- * ----------- * ----------- * ----------- * ----------- * ----------- *
    # | new        |      *      |  Y          |             |             |             |  Y          |
    #  ----------- * ----------- * ----------- * ----------- * ----------- * ----------- * ----------- *
    # | issued     |             |             |  Y          |  Y          |             |  Y          |
    #  ----------- * ----------- * ----------- * ----------- * ----------- * ----------- * ----------- *
    # | paid       |             |             |             |  Y          |             |  Y          |
    #  ----------- * ----------- * ----------- * ----------- * ----------- * ----------- * ----------- *
    # | processing |             |             |             |             |  Y          |  Y          |
    #  ----------- * ----------- * ----------- * ----------- * ----------- * ----------- * ----------- *
    # | closed     |             |             |             |             |             |  Y          |
    #  ----------- * ----------- * ----------- * ----------- * ----------- * ----------- * ----------- *
    # | canceled   |  N          |  N          |  N          |  N          |  N          |  N          |
    #  ----------- * ----------- * ----------- * ----------- * ----------- * ----------- * ----------- *
  end

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
