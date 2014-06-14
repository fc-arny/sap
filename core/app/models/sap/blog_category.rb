# == Schema Information
#
# Table name: sap.blog_categories
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  url        :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

# -------------------------------------------------------------
# Blog categories model (ex.: news, updates etc)
# -------------------------------------------------------------
class Sap::BlogCategory < ActiveRecord::Base

end
