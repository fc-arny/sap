module Sap
  module Core
    class Engine < ::Rails::Engine
      isolate_namespace Sap
      engine_name 'sap'
    end
  end
end