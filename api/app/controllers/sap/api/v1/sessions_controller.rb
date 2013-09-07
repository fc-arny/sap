# -------------------------------------------------------------
# Login/Logout user
# -------------------------------------------------------------
class Sap::Api::V1::SessionsController <  Devise::SessionsController

  # Login user
  # Logic:
  #  * Delete all non-numeric symbols, if 13 >= lenght >= 8 then auth by phone
  #  * Else auth by login. It's need for admin.
  def create
    form = Sap::AuthForm.new(params[:user])

    if form.valid? && @user = Sap::User.find_for_database_authentication(:login => form.login)
      sign_in :user, @user

      @user.ensure_authentication_token!
      @message = t('You are succesfully logged in!')
    else
      # Default error
      form.errors.add(:password, t('Wrong login or password')) if form.errors.empty?

      @errors   = form.errors.messages
      @status   = :fail
    end
  end

  # Logout user
  def destroy
    sign_out :user

    @message = t('You are logged out!')
    render_empty
  end

end