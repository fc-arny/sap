# -------------------------------------------------------------
# User controller - register, login
# -------------------------------------------------------------
class Sap::Api::V1::UserController < Sap::Api::BaseController

  # Try auth user
  def auth
    form = LoginForm.new params[:login_form]

    login     = form.login
    password  = form.password

    if form.valid?
      user = Sap::User.find_by_login(login)
      if user && user.auth_by_password(password)
        # Set session if auth is success
        session[:user_id] = user.id
        render_jsend :success => user, :message => t('You are logged id now')
      else
        form.errors.add :password, t('Wrong login and/or password')
        render_jsend :fail => {:errors => {:login_form => form.errors}}
      end
    else
      render_jsend :fail => {:errors => {:login_form => form.errors}}, :message => t('Errors!PLease input valid data')
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

  # -------------------------------------------------------------
  # PUT/PATCH: Update user info
  # -------------------------------------------------------------
  def update

  end

  # -------------------------------------------------------------
  #
  # -------------------------------------------------------------
  def destroy

  end
end