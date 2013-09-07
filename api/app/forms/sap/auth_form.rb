# -------------------------------------------------------------
# Form model for user login
# -------------------------------------------------------------
class Sap::AuthForm < ActiveForm
  PHONE_LENGTH_MIN = 7
  PHONE_LENGHT_MAX = 14

  attr_accessor :login, :password, :remember_me

  # Validators
  validates :login, :presence => true
  #validates :login, :length => {minimum: 3, maximum: 80}

  validates :password, :presence => true
  #alidates :password, :length => {minimum: 3, maximum: 80}

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
