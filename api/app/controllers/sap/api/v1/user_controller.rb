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
        @errors = {user: resource.errors.messages}
        @status = :fail

        clean_up_passwords resource
      end
    else
      @errors = {user: form.errors.messages}
      @status = :fail
    end
  end

  # Update user
  # PATCH/PUT /user
  def update
    #message_type = :account
    #messages = {
    #  password: {success: t('sap.api.user.message.success_new_password'), error: t('sap.api.user.message.error_new_password')},
    #  account: {success: t('sap.api.user.message.changes_saved_success'), error: t('sap.api.user.message.changes_saved_success')},
    #}
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)

    @forms = {}
    @errors = {}

    if params[:private]
      @forms[:private] = Sap::Account::PrivateForm.new(update_user_params)

      if @forms[:private].valid?
        result = resource.update_without_password(update_user_params)

        if result
          flash[:success] = 'Profile updates success'
        else
          @errors[:private] = resource.errors
        end

      end
    elsif params[:password]
      @forms[:password] = Sap::Account::ChangePasswordForm.new(change_password_params)

      if @forms[:password].valid?
        result = resource.update_with_password(change_password_params)

        if result
          sign_in(resource, :bypass => true)
          flash[:success] = 'Password updates success'
        else
          @errors[:password] = resource.errors
        end
      end
    end

    @forms.each{ |name, form| @errors[name] = form.errors if form.errors } if @errors.empty?
  end

  protected

  # Params permit
  def update_user_params
    params.require(:private).permit(:name, :email)
  end

  # Change password params
  def change_password_params
    params.require(:password).permit(:current_password, :password, :password_confirmation)
  end
end