# -------------------------------------------------------------
# User controller - register, login
# -------------------------------------------------------------
class Sap::Api::V1::UserController < Sap::Api::BaseController

  # Try auth user
  # GET users/auth
  def auth
    @user = Sap::User.find_for_database_authentication(:login => params[:login])

    if @user.valid_password?(params[:password])
      sign_in(:user, @user)
      @user.ensure_authentication_token!
    end
  end

  # Create new user
  # POST
  def create
    customer_form = NewCustomerForm.new

    if customer_form.submit(params[:customer])
      session[:user_id] = customer_form.user.id
      render_jsend :success => {:customer => customer_form.customer}
    else
      render_jsend :fail => customer_form.errors
    end
  end
end