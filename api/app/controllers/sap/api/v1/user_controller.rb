# -------------------------------------------------------------
# User controller create/update/list
# -------------------------------------------------------------
class Sap::Api::V1::UserController < Devise::RegistrationsController

  # Create new user
  # POST /user
  def create
    form = Sap::NewCustomer.new(params[:user])

    if form.valid?
      build_resource form.to_hash

      if resource.save
        sign_up(resource_name, resource)
        flash[:success] = t('sap.api.user.message.success_register')
      else
        @errors = resource.errors.messages
        @status = :fail

        clean_up_passwords resource
      end
    else
      @errors = form.errors.messages
      @status = :fail
    end
  end

  # Update user
  # PATCH/PUT /user
  def update
    message_type = :account
    messages = {
      password: {success: t('sap.api.user.message.success_new_password'), error: t('sap.api.user.message.error_new_password')},
      account: {success: t('sap.api.user.message.changes_saved_success'), error: t('sap.api.user.message.changes_saved_success')},
    }

    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    user_params = update_user_params

    # If password blank, we can't update password
    is_updated = if user_params[:current_password].blank?
      resource.update_without_password(user_params)
    else
      message_type = :password
      result = resource.update_with_password(user_params)

      if result
        sign_in :user, resource
      end

      result
    end

    if is_updated
      flash[:success] = messages[message_type][:success]
    else
      @status = :fail
      @errors = resource.errors.messages

      flash[:error] = messages[message_type][:error]
    end
  end

  protected

    # Params permit
    def update_user_params
      params.require(:user).permit(:current_password, :password, :password_confirmation, :name, :phone)
    end
end