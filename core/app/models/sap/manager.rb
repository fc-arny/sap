# == Schema Information
#
# Table name: sap_managers
#
#  id         :integer          not null, primary key
#  store_id   :integer          not null
#  last_name  :integer          not null
#  first_name :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

# -------------------------------------------------------------
# Store's Manager
# -------------------------------------------------------------
# ==Fields:
# store_id - reference to store
# user_id  - reference to base user model
# -------------------------------------------------------------
class Sap::Manager < ActiveRecord::Base
  # Fields
	attr_accessible :first_name, :last_name, :store_id, :user_id

  # Relationships
  has_one :user, :class_name => 'Sap::User', :as => :role
end
