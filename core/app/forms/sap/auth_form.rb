# -------------------------------------------------------------
# Form model for user login
# -------------------------------------------------------------
class Sap::AuthForm < ActiveForm

  attr_accessor :login, :password

  # Validators
  validates :login,     :presence => true
  validates :password,  :presence => true

  before_validation do
    login.gsub!(/\D/, '') unless login.blank? && !login.start_with?('admin:')
  end

end
