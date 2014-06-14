# == Schema Information
#
# Table name: sap.stores
#
#  id             :integer          not null, primary key
#  name           :string(255)      not null
#  position       :integer          default(0)
#  url            :string(255)      not null
#  system_name    :string(255)
#  active         :boolean          default(FALSE)
#  region_id      :integer
#  work_time_from :time
#  work_time_to   :time
#  created_at     :datetime
#  updated_at     :datetime
#

class Sap::Store < ActiveRecord::Base
  scope :active, -> { where(active: true).order('position') }
  belongs_to :region
end
