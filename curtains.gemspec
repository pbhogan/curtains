# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'curtains/version'

Gem::Specification.new do |spec|
  spec.name          = "curtains"
  spec.version       = Curtains::VERSION
  spec.authors       = ["Patrick Hogan"]
  spec.email         = ["pbhogan@gmail.com"]
  spec.description   = %q{Simple model decorators for Rails 4}
  spec.summary       = %q{Simple model decorators for Rails 4}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
