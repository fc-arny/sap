# == Schema Information
#
# Table name: sap.goods
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  description :text
#  is_approved :boolean          default(FALSE)
#  order_por   :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  measure_id  :integer
#

# -------------------------------------------------------------
# Common good list for all stores
# -------------------------------------------------------------
# ==Fields:
# is_approved - new item entered by a store manager isn't show by default
# status      - state of object (:deleted, :fake and etc)
# vendor_id   - product vendor
# -------------------------------------------------------------
class Sap::Good < SapModel

  # Fields
  attr_accessible :description, :id, :is_approved, :name, :status

  # Associations
  has_many :good_items, :class_name => 'Sap::GoodItem'
  has_and_belongs_to_many :categories, :join_table => 'sap.category_good'

  #belongs_to :vandor, :class_name => 'Sap::Vendor'

  # -------------------------------------------------------------
  # Get list of goods by store
  # -------------------------------------------------------------
  def get_good_list(store = nil, category = nil)
     self.find_all
  end

  # -------------------------------------------------------------
  #
  # -------------------------------------------------------------
  def as_json(options = { })
    super(options.merge(:only => [:id, :name, :price]))
  end
end
