# -------------------------------------------------------------
# 
# -------------------------------------------------------------
class Sap::Api::V1::SessionsController <  Sap::Api::BaseController

  def create
    @user = Sap::User.find_for_database_authentication(:login => params[:login])

    if @user.valid_password?(params[:password])
      sign_in(:user, @user)
      @user.ensure_authentication_token!
    end
  end

end