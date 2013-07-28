module Sap
  module Api
    class Engine < Rails::Engine
      isolate_namespace Sap
      engine_name 'sap_api'

      config.autoload_paths += %W(#{config.root}/decorators/**)
    end

  end
end