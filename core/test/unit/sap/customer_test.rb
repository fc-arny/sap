# == Schema Information
#
# Table name: sap_customers
#
#  id         :integer          not null, primary key
#  phone      :string(255)      not null
#  name       :string(255)
#  is_proved  :boolean          default(FALSE), not null
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class Sap::CustomerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
