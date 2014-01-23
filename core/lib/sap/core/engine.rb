module Sap
  module Core
    class Engine < ::Rails::Engine
      isolate_namespace Sap
      engine_name 'sap'

      config.autoload_paths += %W(#{config.root}/lib)
      config.autoload_paths += %W(#{config.root}/app/models/concerns)
      config.autoload_paths += %W(#{config.root}/app/validators/**)

      config.assets.initialize_on_precompile = true

      initializer :append_migrations do |app|
        unless app.root.to_s.match root.to_s
          config.paths['db/migrate'].expanded.each do |expanded_path|
            app.config.paths['db/migrate'] << expanded_path
          end
        end
      end
    end
  end
end