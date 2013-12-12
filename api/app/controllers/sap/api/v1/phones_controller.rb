# -------------------------------------------------------------
# User phones
# -------------------------------------------------------------
class Sap::Api::V1::PhonesController < Sap::Api::BaseController

  before_filter :authenticate_user!

  # index
  def index
    current_user
  end

  # Reset user phone(login) 
  def reset
    reset_phone = PhoneReset.new(current_user)
    reset_form = Sap::ResetPhoneForm.new(reset_params)

    case reset_form.current_action
      when Sap::ResetPhoneForm::ACT_RESET
        reset_phone.create_code reset_form.phone
      when Sap::ResetPhoneForm::ACT_CHECK
        if reset_phone.valid?(reset_form.to_hash)
          reset_phone.reset(reset_form.phone)
        else
          @errors = reset_phone.errors
        end
    end
  end

  private

  # Reset params
  def reset_params
    params.require(:phone).permit(:phone, :password, :code, :act)
  end
end
