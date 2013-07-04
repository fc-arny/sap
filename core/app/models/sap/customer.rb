# == Schema Information
#
# Table name: sap_customers
#
#  id         :integer          not null, primary key
#  phone      :string(255)      not null
#  name       :string(255)
#  is_proved  :boolean          default(FALSE), not null
#  created_at :datetime
#  updated_at :datetime
#

# -------------------------------------------------------------
# Buyer model referenced to user
# -------------------------------------------------------------
class Sap::Customer < ActiveRecord::Base
  # Fields
  attr_accessible :phone, :name, :role

  # Relationships
  has_one :user, :class_name => 'Sap::User', :as => :role

end
