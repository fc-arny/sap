# == Schema Information
#
# Table name: sp_addresses
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  street     :string(255)      not null
#  comment    :string(255)
#  region_id  :integer          not null
#  owner_id   :integer
#  owner_type :string(255)
#  created_at :datetime
#  updated_at :datetime
#

# -------------------------------------------------------------
# Adresses for any entity
# -------------------------------------------------------------
class Sap::Address < ActiveRecord::Base

  # Relationships
  belongs_to :owner, polymorphic: true
end
