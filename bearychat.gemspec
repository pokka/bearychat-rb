lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bearychat/version'

Gem::Specification.new do |spec|
  spec.name          = "bearychat"
  spec.version       = Bearychat::VERSION
  spec.authors       = ["pokka"]
  spec.email         = ["ifunafu@gmail.com"]

  spec.summary       = %q{Simple ruby library to interact with Bearychat}
  spec.description   = %q{Simple ruby library to interact with Bearychat}
  spec.homepage      = "https://github.com/pokka/bearychat-rb"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty", "~> 0.13.1"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "webmock"
end
