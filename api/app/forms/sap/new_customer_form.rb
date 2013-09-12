require 'sap/core/validators/phone'
# -------------------------------------------------------------
# Registration form for customer
# -------------------------------------------------------------
class Sap::NewCustomerForm < ActiveForm

  attr_accessor :login, :password, :name, :is_temporary, :phone

  # Validators
  validates :login, presence: true
  validates :phone, phone: true
  validates :phone, format: {with: /\A\+?[\d|\s|\-|\(|\)]*\z/}         #TODO: Move to phone validator
  validates :password,  length: 3..80, presence: true
  validates :name,      length: 2..80, presence: true
  validates :is_temporary, exclusion: { in: [true, false] }

  before_validation :on_before_validation
  after_validation  :on_after_validation

  private
    # Prepare params
    def on_before_validation
      @login = @phone = @phone.strip
      @name.strip!
      @password.strip!
    end

    # Run after validation
    def on_after_validation
      if @is_temporary
        @name     = t('Customer')
        @login    = sprintf('%<phone>s+%<time>s@gmarket.fm',{phone: @phone.to_s, time: Time.now.to_i})
        @password = Devise.friendly_token.first(10)
      end
    end
end