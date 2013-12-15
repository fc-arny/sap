# -------------------------------------------------------------
# 
# -------------------------------------------------------------
class Sap::Account::ChangePasswordForm < ActiveForm
  attr_accessor :password, :current_password
  validates :password, confirmation: true
end