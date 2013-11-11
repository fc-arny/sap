# -------------------------------------------------------------
# Form model for user login
# -------------------------------------------------------------
class Sap::AuthForm < ActiveForm

  attr_accessor :login, :password, :remember_me

  # Validators
  validates :login,     :presence => true
  validates :password,  :presence => true

  before_validation :prepare

  private
    # Prepare login: by phone
    def prepare
      @login.gsub(/\D/,'')

      # Always remeber
      @remember_me = true
    end
end
