module Sap
  module Backend
    class Engine < Rails::Engine
      isolate_namespace Sap
      engine_name 'sap_backend'

      config.assets.paths += %W(
      #{config.root}/assets/fonts/**
                            #{config.root}/assets/templates/**)
    end
  end
end