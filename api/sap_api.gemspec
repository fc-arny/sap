# coding: utf-8
version = File.read(File.expand_path("../../SAP_VERSION", __FILE__)).strip

Gem::Specification.new do |spec|
  spec.name          = "sap_api"
  spec.version       = version
  spec.authors       = ["Arthur Shcheglov"]
  spec.email         = ["arthur.shcheglov@gmail.com"]
  spec.description   = "API for SAP application"
  spec.summary       = "API for SAP application"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'sap_core', version
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
