module Sap
  module Core
    class Engine < ::Rails::Engine
      isolate_namespace Sap
      engine_name 'sap'

      config.autoload_paths += %W(#{config.root}/lib)

    end
  end
end