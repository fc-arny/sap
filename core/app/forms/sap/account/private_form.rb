module Sap
  module Account
    class PrivateForm < ActiveForm
      attr_accessor :name, :phone, :email

      validates :name, length: {minimum: 3, maximum: 80}, presence: true
      validates :email, length: {minimum: 6, maximum: 80}, allow_blank: true
    end
  end
end
