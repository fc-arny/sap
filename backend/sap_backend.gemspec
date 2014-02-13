# coding: utf-8
version = File.read(File.expand_path('../../SAP_VERSION', __FILE__)).strip

Gem::Specification.new do |spec|
  spec.name          = 'sap_backend'
  spec.version       = version
  spec.authors       = ['Arthur Shcheglov']
  spec.email         = ['arthur.shcheglov@gmail.com']
  spec.description   = 'The bare bones necessary for Sap'
  spec.summary       = 'The bare bones necessary for Sap'
  spec.homepage      = 'http://martsoft.ru'
  spec.license       = 'MIT'

  spec.files         = Dir['LICENSE', 'README.md', 'app/**/*', 'config/**/*', 'lib/**/*', 'db/**/*']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'sap_core', version
  spec.add_dependency 'sap_api', version

  spec.add_dependency 'rails-backbone'
  spec.add_dependency 'marionette-rails'
  spec.add_dependency 'haml_coffee_assets'
  spec.add_dependency 'rails_admin'
  spec.add_dependency 'cancan'
  spec.add_dependency 'paper_trail', '~> 3.0.0'
end