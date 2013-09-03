# == Schema Information
#
# Table name: sap_admins
#
#  id         :integer          not null, primary key
#  city_id    :integer
#  name       :string(255)      not null
#  position   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

# -------------------------------------------------------------
# GloboMarket's administrators
# -------------------------------------------------------------
# ==Fields:
# city_id  - admin by city or global admin if null
# position - position in company
# user_id  - reference to user
# -------------------------------------------------------------
class Sap::Admin < ActiveRecord::Base
  has_one :user, :class_name => 'Sap::User', :as => :role
end
