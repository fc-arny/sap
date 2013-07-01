# coding: utf-8
version = File.read(File.expand_path("../../SAP_VERSION", __FILE__)).strip

Gem::Specification.new do |spec|
  spec.name          = "sap_core"
  spec.version       = version
  spec.authors       = ["fc_arny"]
  spec.email         = ["arthur.shcheglov@gmail.com"]
  spec.description   = "The bare bones necessary for Sap"
  spec.summary       = "The bare bones necessary for Sap"
  spec.homepage      = "http://martsoft.ru"
  spec.license       = "MIT"

  spec.files         = Dir['LICENSE', 'README.md', 'app/**/*', 'config/**/*', 'lib/**/*', 'db/**/*', 'vendor/**/*']
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_dependency 'rails'
end
