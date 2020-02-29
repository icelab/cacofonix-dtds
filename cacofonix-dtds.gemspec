# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "cacofonix/dtds/version"

Gem::Specification.new do |spec|
  spec.name          = "cacofonix-dtds"
  spec.version       = Cacofonix::DTDs::VERSION
  spec.authors       = ["Tim Riley"]
  spec.email         = ["tim@icelab.com.au"]

  spec.summary       = "XML catalog for locally accessible ONIX 2.0 and 2.1 DTDs"
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/icelab/cacofonix-dtds"
  spec.license       = "MIT"

  spec.metadata["homepage_uri"]     = spec.homepage
  spec.metadata["source_code_uri"]  = spec.homepage
  spec.metadata["changelog_uri"]    = "https://github.com/icelab/cacofonix-dtds/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files        = Dir.chdir(File.expand_path("..", __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
