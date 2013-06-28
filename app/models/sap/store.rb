# == Schema Information
#
# Table name: sap.stores
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  order_pos  :integer          default(0)
#  url        :string(255)      not null
#  region_id  :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# -------------------------------------------------------------
# Contain base information about business-clients (for example "Azbuka Vkusa", "Allye Parusa")
# -------------------------------------------------------------
# =Fields:
#  order_pos    - position in store list
#  url          - name in latin for links
#  is_disables  - don't work with the client
#  region_id    - link to region
#  work_time_from, work_time_to - work period, ex.: 10.00 - 23.00, if null then round-the-clock
# -------------------------------------------------------------
class Sap::Store < SapModel
  # Fields
	attr_accessible :id, :name, :url, :order_pos, :region_id

  # -------------------------------------------------------------
  # Get actual store list
  # -------------------------------------------------------------
  def self.get_store_list
    self.all
  end
end
