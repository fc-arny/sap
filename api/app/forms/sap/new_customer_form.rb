# -------------------------------------------------------------
# Registration form for customer
# -------------------------------------------------------------
class Sap::NewCustomerForm < ActiveForm

  include ApplicationHelper

  # Validators
  validate :verify_user
  validates_presence_of :phone
  validates_presence_of :name
  validates_presence_of :password


  delegate :phone, :name, :password, to: :customer
  delegate :password, :login, :is_temporary, to: :user

  # Callbacks
  before_validation :filter_params

  # Get customer model
  def customer
    @customer ||= Sap::Customer.new
  end

  #  Get user model
  def user
    @user ||= customer.build_user
  end

  # -------------------------------------------------------------
  # Create new customer
  # -------------------------------------------------------------
  def submit(params)
    customer.attributes = params.slice(:name, :phone)
    user.attributes = params.slice(:is_temporary, :password)

    # Create user
    user.login    = customer.phone
    user.salt     = get_random_string()

    # if w/o sign up
    if user.is_temporary
      user.login    = "#{customer.phone.to_s}_#{Time.now.to_i.to_s}@#{TEMP_USET_SUFFIX}"
      user.password = get_random_string(TEMP_USET_PASSWORD_LENGTH)

      customer.name = I18n.t('Customer')
    end

    user.password = hash_password(user.password, user.salt)


    if valid?
      customer.save!
      return true
    end

    false
  end

  private

  # -------------------------------------------------------------
  # Filter params
  # -------------------------------------------------------------
  def filter_params
    user.login.gsub!(/[^0-9]/,'')
    customer.phone.gsub!(/[^0-9]/,'')
  end


  # -------------------------------------------------------------
  # Exist user or not
  # -------------------------------------------------------------
  def verify_user
    if Sap::User.exists?(:login => user.login) || Sap::Customer.exists?(:phone => customer.phone)
      errors.add  :phone, I18n.t('User with such phone already exists.')
    end
  end
end