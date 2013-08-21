# == Schema Information
#
# Table name: sap_addresses
#
#  id         :integer          not null, primary key
#  region_id  :integer
#  street     :string(255)
#  title      :string(255)
#  comment    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class Sap::AddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
