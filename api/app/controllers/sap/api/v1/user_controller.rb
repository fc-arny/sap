# -------------------------------------------------------------
# User controller create/update/list
# -------------------------------------------------------------
class Sap::Api::V1::UserController < Devise::RegistrationsController

  # Create new user
  # POST /user
  def create
    form = Sap::NewCustomer.new(params[:user])

    if form.valid?
      form_data = {
        name:         form.name,
        login:        form.login,
        password:     form.password,
        is_temporary: form.is_temporary
      }

      build_resource form_data

      if resource.save
        # Create customer
        customer = Sap::Customer.new do |c|
          c.user       = resource
          c.first_name = resource.name
          c.phone      = form.phone
        end
        customer.save

        sign_up(resource_name, resource)
        resource.ensure_authentication_token!
        flash[:success] = t('api.user.success_regisrer')
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
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)

    user_params = update_user_params

    # If password blank, we can't update password
    is_updated = if user_params[:current_password].blank?
      resource.update_without_password(user_params)
    else
      resource.update_with_password(user_params)
    end

    if is_updated
      @message = t('sap.messages.changes_saved')
    else
      @status = :fail
      @data = {errors: resource.errors.messages }
    end

    render_empty
  end

  protected

    # Params permit
    def update_user_params
      params.require(:user).permit(:current_password, :password, :password_confirmation, :name)
    end
end