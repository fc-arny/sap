# == Schema Information
#
# Table name: sap_categories
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  url        :string(255)      not null
#  order_pos  :integer          default(0)
#  parent_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class Sap::CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
