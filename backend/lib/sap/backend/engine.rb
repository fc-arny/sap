module Sap
  module Backend
    class Engine < Rails::Engine
      isolate_namespace Sap
      engine_name 'sap_backend'
    end
  end
end