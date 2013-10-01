# -------------------------------------------------------------
# Change and recover password
# -------------------------------------------------------------
class Sap::Api::V1::UserPasswordsController < Devise::PasswordsController
  prepend_before_filter :require_no_authentication

  # Create password
  # POST /
  def create
    set_response_params(:status => :error)
    t = 1
  end

  # Reset password by token
  # PATCH /
  def update
    self.resource = resource_class.reset_password_by_token(resource_params)

    if resource.errors.empty?
      sign_in(resource_name, resource)
    else
      @mesage = t('Wrong current password')
    end
  end
  
  private
  # Update password permition 
  def permitted_params
    params.require(:user).permit(:password, :password_conformation)
  end
end