# == Schema Information
#
# Table name: sap_managers
#
#  id         :integer          not null, primary key
#  store_id   :integer          not null
#  last_name  :integer          not null
#  first_name :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class Sap::ManagerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
