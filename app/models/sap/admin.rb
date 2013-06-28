# == Schema Information
#
# Table name: sap.admins
#
#  id         :integer          not null, primary key
#  city_id    :integer
#  name       :string(255)      not null
#  position   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# -------------------------------------------------------------
# GloboMarket's administrators
# -------------------------------------------------------------
# ==Fields:
# city_id  - admin by city or global admin if null
# position - position in company
# user_id  - reference to user
# -------------------------------------------------------------
class Sap::Admin < SapModel
  has_one :user, :class_name => 'Sap::User', :as => :role
  attr_accessible :city_id, :position, :user_id
end
