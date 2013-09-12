# -------------------------------------------------------------
# User register
# -------------------------------------------------------------
class Sap::Api::V1::UserController < Devise::RegistrationsController

  wrap_parameters :user => [:login, :password, :name]

  # Create new user
  # POST
  def create
    form = Sap::NewCustomerForm.new(params[:user])

    if form.valid?
      build_resource(login: form.login, password: form.password, name: form.name)

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

  private
  #
  def register_params

  end
end