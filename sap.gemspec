# coding: utf-8
version = File.read(File.expand_path('../SAP_VERSION',__FILE__)).strip

Gem::Specification.new do |spec|
  spec.name          = 'sap'
  spec.version       = version
  spec.description   = 'Full-stack platform for e-commerce'
  spec.summary       = 'SAP is a platform for multistore ecommerce application'
  spec.license       = 'FSF'

  spec.authors       = ['Arthur Shcheglov']
  spec.email         = ['arthur.shcheglov@gmail.com']
  spec.homepage      = 'http://martsoft.ru/sap'

  spec.files         = Dir['README.md', 'lib/**/*']
  spec.require_paths = ['lib']
  spec.requirements << 'none'

  # Sap
  spec.add_dependency 'sap_core', version
  spec.add_dependency 'sap_api', version
  spec.add_dependency 'sap_backend', version
end
