# -------------------------------------------------------------
# Change and recover password
# -------------------------------------------------------------
class Sap::Api::V1::UserPasswordsController < Devise::PasswordsController
  prepend_before_filter :require_no_authentication

  # Create password
  # POST /
  def create
    self.resource = resource_class.find_or_initialize_with_errors(reset_password_keys, resource_params, :not_found)
    resource.ensure_reset_password_token!
  end

  # Reset password by token
  # PATCH /
  def update
    self.resource = resource_class.reset_password_by_token(resource_params)

    if resource.errors.empty?
      sign_in(resource_name, resource)
    else
      @message = t('Wrong current password')
    end
  end
  
  private
  # Update password permition 
  def permitted_params
    params.require(:user).permit(:password, :password_conformation)
  end
end