# == Schema Information
#
# Table name: sap.vendors
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

# -------------------------------------------------------------
# Vandors model
# -------------------------------------------------------------
# ==Fields:
# name      - name of vendor with country (ex.: Danone (Russia))
# -------------------------------------------------------------
class Sap::Vendor < ActiveRecord::Base
  #attr_accessible :id, :name
end
