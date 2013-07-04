module Sap
  module Api
    class Engine < Rails::Engine
      isolate_namespace Sap
      engine_name 'sap_api'
    end

  end
end