# -------------------------------------------------------------
# Adresses for any entity
# -------------------------------------------------------------
class Sap::Address < ActiveRecord::Base

  # Relationships
  belongs_to :owner, polymorphic: true
end