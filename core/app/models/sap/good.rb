# == Schema Information
#
# Table name: sap_goods
#
#  id            :integer          not null, primary key
#  name          :string(255)      not null
#  measure_id    :integer          not null
#  measure_value :integer          not null
#  measure_step  :integer          default(1), not null
#  description   :text
#  is_approved   :boolean          default(FALSE)
#  order_pos     :integer          default(0)
#  created_at    :datetime
#  updated_at    :datetime
#

# -------------------------------------------------------------
# Common good list for all stores
# -------------------------------------------------------------
# ==Fields:
# is_approved - new item entered by a store manager isn't show by default
# status      - state of object (:deleted, :fake and etc)
# vendor_id   - product vendor
# -------------------------------------------------------------
class Sap::Good < ActiveRecord::Base

  # Fields
  attr_accessible :description, :id, :is_approved, :name, :status, :measure_id, :value

  # Associations
  has_many :good_items, :class_name => 'Sap::GoodItem'
  has_and_belongs_to_many :categories, :join_table => 'sap_category_good'

  #belongs_to :vandor, :class_name => 'Sap::Vendor'

  # Get list of goods by store
  def get_good_list(store = nil, category = nil)
     self.find_all
  end
end
