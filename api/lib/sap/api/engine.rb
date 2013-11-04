module Sap
  module Api
    class Engine < Rails::Engine
      isolate_namespace Sap
      engine_name 'sap_api'

      config.autoload_paths += %W(#{config.root}/decorators/**)
      config.i18n.load_path +=
        Dir[config.root.join('config', 'locales', '**', '*.{rb,yml}')]
    end

  end
end