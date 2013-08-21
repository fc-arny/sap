# == Schema Information
#
# Table name: sap_orders
#
#  id         :integer          not null, primary key
#  state      :string(255)
#  hash_str   :string(255)
#  sum        :decimal(, )
#  user_id    :integer
#  phone_id   :integer                                # Link to phone
#  address    :string(255)                            # Address string: area, street, house number and etc
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class Sap::OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
