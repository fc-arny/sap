require 'i18n'
require 'active_support/core_ext/array/extract_options'
require 'sap/i18n/base'

module Sap
  extend ActionView::Helpers::TranslationHelper

  class << self
    # Add sap namespace and delegate to Rails TranslationHelper for some nice
    # extra functionality. e.g return reasonable strings for missing translations
    def translate(*args)
      @virtual_path = virtual_path

      options = args.extract_options!
      options[:scope] = [*options[:scope]].unshift(:sap)
      args << options
      super(*args)
    end

    alias_method :t, :translate

    def context
      Sap::ViewContext.context
    end

    def virtual_path
      if context
        path = context.instance_variable_get("@virtual_path")

        if path
          path.gsub(/sap/, '')
        end
      end
    end
  end
end
