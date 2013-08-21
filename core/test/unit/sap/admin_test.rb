# == Schema Information
#
# Table name: sap_admins
#
#  id         :integer          not null, primary key
#  city_id    :integer
#  name       :string(255)      not null
#  position   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class Sap::AdminTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
