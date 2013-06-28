# -------------------------------------------------------------
# Base model for SAP
# -------------------------------------------------------------
class Sap::BaseModel < ActiveRecord::Base

  def self.table_name_prefix
    'sap.'
  end

end