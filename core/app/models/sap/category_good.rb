# == Schema Information
#
# Table name: sap_category_good
#
#  id          :integer          not null, primary key
#  category_id :integer
#  good_id     :integer
#

# -------------------------------------------------------------
# 
# -------------------------------------------------------------
class Sap::CategoryGood < ActiveRecord::Base

  #attr_accessible :category_id, :good_id

end
