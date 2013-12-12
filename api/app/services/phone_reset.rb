# -------------------------------------------------------------
# Reset customer phone
# -------------------------------------------------------------
class PhoneReset

  CODE_LENGTH = 6

  attr_accessor :errors

  # Init
  def initialize(user)
    @user = user
    @errors = {}
  end

  # Create code
  def create_code(phone)
    @user.reset_phone_new = phone
    @user.reset_phone_code = generate_code
    @user.reset_phone_sent_at = Time.now
    @user.save

    # TODO: sent SMS with code
  end

  # Check
  def valid?(attributes)
    exists_user = Sap::User.where('phone = ?', attributes[:phone]).first

    unless @user.valid_password?(attributes[:password])
      add_error(:password, 'Wrong current password')
    else
      unless @user.reset_phone_code == attributes[:code] && @user.reset_phone_new == attributes[:phone] && Time.parse(@user.reset_phone_sent_at) > 20.minutes.ago
        add_error(:code, 'Wrong code or time is expired')
      else
        if exists_user
          exists_user.delete
        end
      end
    end

    @errors.empty?

  end

  # Reset
  def reset(phone)
    @user.reset_phone_new = nil
    @user.reset_phone_code = nil
    @user.reset_phone_sent_at = nil

    @user.login = @user.phone = phone
    @user.save
  end

  private

  # Generate code
  def generate_code
    CODE_LENGTH.times.map { Random.rand(10).to_s }.join
  end

  # Add error
  def add_error(field, message)
    @errors[field] ||= []
    @errors[field] << message
  end

end
