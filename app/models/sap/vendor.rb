# -------------------------------------------------------------
# Vandors model
# -------------------------------------------------------------
# ==Fields:
# name      - name of vendor with country (ex.: Danone (Russia))
# -------------------------------------------------------------
class Sap::Vendor < ActiveRecord::Base
  attr_accessible :id, :name
end
