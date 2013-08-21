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

require 'test_helper'

class Sap::StoreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
