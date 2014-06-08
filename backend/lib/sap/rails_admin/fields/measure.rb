module Sap
  module RailsAdmin
    module Fields
      class Measure < ::RailsAdmin::Config::Fields::Base
        ::RailsAdmin::Config::Fields::Types.register(self)

        register_instance_option :partial do
          :measure
        end
      end
    end
  end
end
