
class Sap::CategoryGood < ActiveRecord::Base
  belongs_to :good
  belongs_to :category
end
