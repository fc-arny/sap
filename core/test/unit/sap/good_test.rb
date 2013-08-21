# == Schema Information
#
# Table name: sap_goods
#
#  id            :integer          not null, primary key
#  name          :string(255)      not null
#  measure_id    :integer          not null
#  measure_value :integer          not null
#  measure_step  :integer          default(1), not null
#  description   :text
#  is_approved   :boolean          default(FALSE)
#  order_pos     :integer          default(0)
#  created_at    :datetime
#  updated_at    :datetime
#

require 'test_helper'

class Sap::GoodTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
