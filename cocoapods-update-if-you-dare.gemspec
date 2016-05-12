# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cocoapods-update-if-you-dare/version'

Gem::Specification.new do |spec|
  spec.name          = "cocoapods-update-if-you-dare"
  spec.version       = CocoapodsUpdateIfYouDare::VERSION
  spec.authors       = ["Ashton Williams"]
  spec.email         = ["Ashton-W@users.noreply.github.com"]
  spec.summary       = %q{update ... if you dare}
  spec.description   = %q{Go ahead, just update. I dare you.}
  spec.homepage      = "https://github.com/Ashton-W/cocoapods-update-if-you-dare"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3.0"
end
