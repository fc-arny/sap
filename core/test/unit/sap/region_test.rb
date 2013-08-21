# == Schema Information
#
# Table name: sap_regions
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  state       :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class Sap::RegionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
