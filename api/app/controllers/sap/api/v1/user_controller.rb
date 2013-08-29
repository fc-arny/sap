# -------------------------------------------------------------
# User register
# -------------------------------------------------------------
class Sap::Api::V1::UserController < Devise::RegistrationsController

  # Create new user
  # POST
  #def create
  #  customer_form = NewCustomerForm.new
  #
  #  if customer_form.submit(params[:customer])
  #    session[:user_id] = customer_form.user.id
  #    render_jsend :success => {:customer => customer_form.customer}
  #  else
  #    render_jsend :fail => customer_form.errors
  #  end
  #end

  private
  #
  def register_params

  end
end