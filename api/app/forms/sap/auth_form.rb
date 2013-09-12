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
    # Prepare login: by phone or by login
    def prepare
      phone = @login.gsub(/[^0-9]/,'')

      if phone.length.between?(PHONE_LENGTH_MIN, PHONE_LENGHT_MAX)
        @login = phone
      end

      # Always remeber
      @remember_me = true
    end
end
