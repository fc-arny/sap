# == Schema Information
#
# Table name: sap_regions
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  description :string(255)
#  parent_id   :integer
#  created_at  :datetime
#  updated_at  :datetime
#

# -------------------------------------------------------------
# Regions
# -------------------------------------------------------------
# ==Fields:
# name        - region name
# state       - is active or in progress
# description - some notes
# -------------------------------------------------------------

class Sap::Region < Sap::Base
  #attr_accessible :id, :name, :state, :description
end
