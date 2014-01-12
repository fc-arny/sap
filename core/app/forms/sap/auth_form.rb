# -------------------------------------------------------------
# Form model for user login
# -------------------------------------------------------------
class Sap::AuthForm < ActiveForm

  attr_accessor :phone, :login, :password

  # Validators
  validates :login,     :presence => true
  validates :password,  :presence => true

  before_validation do
    login.strip!
    @phone = login

    if !@phone.blank? && !@phone.gsub(/\D/, '').empty?
      @phone.gsub!(/\D/, '')
    end
  end

end
