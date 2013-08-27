module Sap::Api::ControllerSetup
  # Setup API controllers
  def self.included(klass)
    klass.class_eval do
      include AbstractController::Callbacks
      include AbstractController::Helpers

      include ActiveSupport::Rescuable

      include ActionController::Rendering
      include ActionController::ImplicitRender
      include ActionController::Rescue
      include ActionController::MimeResponds
      include ActionController::Head
    end
  end
end