# -------------------------------------------------------------
# Login/Logout user
# -------------------------------------------------------------
class Sap::Api::V1::UserSessionsController <  Devise::SessionsController

  # Login user
  # Logic:
  #  * Delete all non-numeric symbols, if 13 >= lenght >= 8 then auth by phone
  #  * Else auth by login. It's need for admin.
  def create
    form = Sap::AuthForm.new(params[:user])

    if form.valid? && @user = Sap::User.find_for_database_authentication(:login => form.login)
      sign_in :user, @user

      @user.ensure_authentication_token!
      @message = flash[:success] = t('sap.api.user.message.success_login')
    else
      # Default error
      form.errors.add(:password, t('sap.api.user.message.wrong_login_or_password')) if form.errors.empty?

      @errors   = form.errors.messages
      @status   = :fail
    end
  end

  # Logout user
  def destroy
    sign_out :user

    @message = t('sap.api.user.message.log_out')
    render_empty
  end

end