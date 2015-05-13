# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hermes/version'

Gem::Specification.new do |spec|
  spec.name          = "hermes"
  spec.version       = Hermes::VERSION
  spec.authors       = ["Liss McCabe"]
  spec.email         = ["liss@eristiccode.com"]

  spec.summary       = %q{A cool programming problem with a focus on good design.}
  spec.description   = %q{Processes debits, credits, and credit card validation.}
  spec.homepage      = "http://github.com/dysnomian/hermes"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler",     "~> 1.9"
  spec.add_development_dependency "rake",        "~> 10.0"
  spec.add_dependency             "require_all", "~> 1.3"
end
