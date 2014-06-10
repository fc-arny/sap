module Sap
  module RailsAdmin
    module Fields
      class Measure < ::RailsAdmin::Config::Fields::Base
        ::RailsAdmin::Config::Fields::Types.register(self)

        def initialize(parent, name, properties)
          super(parent, name, properties)

          parent.field(:value, :hidden)
          parent.field(:measure_id, :hidden)
        end

        register_instance_option :partial do
          :measure
        end
      end
    end
  end
end
