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

class Sap::Measure < ActiveRecord::Base
  attr_accessible :id, :name, :parent_id, :step, :value_in_parent
end
