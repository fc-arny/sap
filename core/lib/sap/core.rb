require 'rails/all'
require 'devise'

module Sap

  autoload :UserParameterSanitizer, 'user_parameter_sanitizer'

  # Used to configure Sap.
  #
  # Example:
  #
  #   Sap.config do |config|
  #     config.site_name = "An awesome Sap site"
  #   end
  #
  # This method is defined within the core gem on purpose.
  # Some people may only wish to use the Core part of Sap.
  def self.config(&block)
    yield(Sap::Config)
  end
end

require 'sap/core/version'
require 'sap/core/engine'
