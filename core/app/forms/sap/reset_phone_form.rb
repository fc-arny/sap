# -------------------------------------------------------------
# Reset phone in user's profile
# -------------------------------------------------------------
class Sap::ResetPhoneForm < ActiveForm

  ACT_RESET = 'reset'
  ACT_CHECK = 'check'

  attr_accessor :phone, :password, :code

  before_validation :sanitize

  validates :phone, presence: true, phone: true

  # Action 
  def current_action
    sanitize

    if self.code.blank? && self.password.blank?
      ACT_RESET
    else
      ACT_CHECK
    end
  end

  private

  # Sanitize params
  def sanitize
    self.phone = self.phone.gsub('\D', '')
  end
end