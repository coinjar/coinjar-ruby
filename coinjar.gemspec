# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'coinjar/version'

Gem::Specification.new do |spec|
  spec.name          = "coinjar"
  spec.version       = CoinJar::VERSION
  spec.authors       = ["CoinJar Pty Ltd", "Ryan Zhou", "Jerrold Poh"]
  spec.email         = ["info@coinjar.io"]
  spec.description   = ["Official Ruby gem for CoinJar."]
  spec.summary       = ["CoinJar is an easy-to-use Bitcoin payment platform."]
  spec.homepage      = "https://coinjar.io"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "shoulda"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "guard-rspec"
  spec.add_runtime_dependency "rest-client"
  spec.add_runtime_dependency "multi_json"
  spec.add_runtime_dependency "activesupport"
end
