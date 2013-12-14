# -------------------------------------------------------------
# Reset phone in user's profile
# -------------------------------------------------------------
class Sap::ResetPhoneForm < ActiveForm

  ACT_RESET = 'reset'
  ACT_CHECK = 'check'

  attr_accessor :phone, :password, :code, :act

  before_validation :sanitize

  validates :phone, presence: true, phone: true

  private

  # Sanitize params
  def sanitize
    self.phone = self.phone.gsub(/\D/, '')
  end
end