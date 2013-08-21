# == Schema Information
#
# Table name: sap_measures
#
#  id              :integer          not null, primary key
#  name            :string(255)      not null
#  step            :integer          not null
#  value_in_parent :integer
#  parent_id       :integer
#

require 'test_helper'

class Sap::MeasureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
