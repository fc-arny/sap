# == Schema Information
#
# Table name: sap.user_settings
#
#  id      :integer          not null, primary key
#  user_id :integer          not null
#  key     :string(255)
#  value   :string(255)
#

require 'test_helper'

class Sap::UserSettingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
