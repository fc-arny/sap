# == Schema Information
#
# Table name: sap_stores # List of stores
#
#  id             :integer          not null, primary key # List of stores
#  name           :string(255)      not null              # Store's name
#  order_pos      :integer          default(0)            # Value for sorting stores
#  url            :string(255)      not null              # Url segment
#  region_id      :string(255)                            # LInk to store's region
#  work_time_from :time
#  work_time_to   :time
#  created_at     :datetime
#  updated_at     :datetime
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
class Sap::Store < ActiveRecord::Base

  # Fields
	#attr_accessible :id, :name, :url, :order_pos, :region_id

  # -------------------------------------------------------------
  # Get actual store list
  # -------------------------------------------------------------
  def self.get_store_list
    self.all
  end
end
