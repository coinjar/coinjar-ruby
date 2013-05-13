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
  spec.summary       = ["Official Ruby gem for CoinJar."]
  spec.homepage      = "https://coinjar.io"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
