# -------------------------------------------------------------
# User register
# -------------------------------------------------------------
class Sap::Api::V1::UserController < Devise::RegistrationsController

  wrap_parameters :user => [:login, :password, :name]

  # Create new user
  # POST
  def create
    build_resource(sign_up_params)

    # Create customer
    customer = Sap::Customer.new do |customer|
      customer.user = resource
      customer.name = resource.name
      customer.phone = resource.login
    end

    if customer.save
      sign_up(resource_name, resource)
    else
      @message = t('Registration failed. Try again.')
      @status = :fail
    end

  end

  private
  #
  def register_params

  end
end