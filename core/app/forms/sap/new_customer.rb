# -------------------------------------------------------------
# Registration form for customer
# -------------------------------------------------------------
class Sap::NewCustomer < ActiveForm

  attr_accessor :login, :password, :name, :is_temporary, :phone

  PHONE_FORMAT = /\A+?7([0-9]{5,12})\z/

  # Validators
  validates :phone, format: {with: PHONE_FORMAT, message: I18n.t('api.user.validator.wrong_phone_format') }
  validates :password,
            length: {minimum: 3, maximum: 80, message: I18n.t('api.user.validator.password_min_max_length') },
            presence: true
  validates :name,      length: 2..80, presence: true
  validates :is_temporary, exclusion: { in: [true, false] }

  before_validation :on_before_validation
  after_validation  :on_after_validation

  private
    # Prepare params
    def on_before_validation
      @phone = @login = @phone.gsub(/\D/, '')

      @name.strip!
      @password.strip!
      @is_temporary = @is_temporary.to_i
    end

    # Run after validation
    def on_after_validation
      unless @is_temporary == 0
        @name     = I18n.t('Customer')
        @login    = sprintf('%<phone>s+%<time>s@gmarket.fm',{phone: @phone.to_s, time: Time.now.to_i})
        @password = Devise.friendly_token.first(10)
      end
    end
end