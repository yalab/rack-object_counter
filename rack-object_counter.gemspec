# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack/object_counter/version'

Gem::Specification.new do |spec|
  spec.name          = "rack-object_counter"
  spec.version       = Rack::ObjectCounter::VERSION
  spec.authors       = ["yalab"]
  spec.email         = ["rudeboyjet@gmail.com"]

  spec.summary       = "Logging per request memory usage with rack app."
  spec.description   = <<-EOS
  EOS
  spec.homepage      = "https://github.com/yalab/rack-object_counter"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "rack-test"
  spec.add_dependency "rack"
end
