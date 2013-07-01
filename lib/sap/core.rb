require 'rails/all'

module Sap

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
