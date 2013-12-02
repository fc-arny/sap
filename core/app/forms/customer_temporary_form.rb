# -------------------------------------------------------------
# Form model temporary user account
# -------------------------------------------------------------
class CustomerTemporaryForm < ActiveForm

  # Fields
  attr_accessor :login, :name

  # Validators
  validates :login,
            :presence => true

  validates :name,
            :presence => true
end
