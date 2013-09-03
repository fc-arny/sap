# -------------------------------------------------------------
# Parameter sanitizer
# -------------------------------------------------------------
class Sap::User::ParameterSanitizer < Devise::ParameterSanitizer

  # Overrides

  def sign_up
    default_params.permit(:login, :name, :password)
  end
end