# == Schema Information
#
# Table name: sap_order_items
#
#  id           :integer          not null, primary key
#  order_id     :integer
#  good_item_id :integer
#  count        :integer
#  created_at   :datetime
#  updated_at   :datetime
#

require 'test_helper'

class Sap::OrderItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
