module Sap
  module Backend
    class Engine < Rails::Engine
      isolate_namespace Sap
      engine_name 'sap_backend'

      config.assets.paths += %W(#{config.root}/app/assets/stylesheets)

      config.i18n.load_path +=
        Dir[config.root.join('config', 'locales', '**', '*.{rb,yml}')]
    end
  end
end