# == Schema Information
#
# Table name: sp_sms
#
#  id         :integer          not null, primary key
#  number     :integer
#  message    :string(255)
#  created    :datetime
#  provider   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Sap::Sms < ActiveRecord::Base
end
