# coding: utf-8
version = File.read(File.expand_path('../../SAP_VERSION', __FILE__)).strip

Gem::Specification.new do |spec|
  spec.name          = 'sap_core'
  spec.version       = version
  spec.authors       = ['Arthur Shcheglov']
  spec.email         = ['arthur.shcheglov@gmail.com']
  spec.description   = 'The bare bones necessary for Sap'
  spec.summary       = 'The bare bones necessary for Sap'
  spec.homepage      = 'http://martsoft.ru/sap'
  spec.license       = 'MIT'

  spec.files         = Dir['LICENSE', 'README.md', 'app/**/*', 'config/**/*', 'lib/**/*', 'db/**/*', 'vendor/**/*']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']


  spec.add_dependency 'jbuilder'  # Create api response json
  spec.add_dependency 'draper', '~> 1.0'

  spec.add_dependency 'ransack'   # For search

  spec.add_dependency 'devise'
  spec.add_dependency 'cancan'

  spec.add_dependency 'js-routes'             # Url helpers in js
  spec.add_dependency 'i18n-js'               # I18n for js

  spec.add_dependency 'carrierwave'           # Image uploader
  spec.add_dependency 'seedbank'              # Data for any environment
  spec.add_dependency 'ancestry'              # Tree presentation for category
  spec.add_dependency 'foreigner'             # Foreign key
  spec.add_dependency 'annotate'              # Annotate models
  spec.add_dependency 'oj'                    # Fast json
  spec.add_dependency 'oj_mimic_json'
end
