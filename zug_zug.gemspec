lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "zug_zug/version"

Gem::Specification.new do |spec|
  spec.name          = "zug_zug"
  spec.version       = ZugZug::VERSION
  spec.authors       = ["Ronan Limon Duparcmeur"]
  spec.email         = ["ronan@2-45.pm"]

  spec.summary       = "Hook Warcraft sounds to your Git commands"
  spec.homepage      = "https://github.com/r3trofitted/zug_zug"
  spec.license       = "MIT"

  spec.metadata["homepage_uri"]    = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/r3trofitted/zug_zug"
  spec.metadata["changelog_uri"]   = "https://github.com/r3trofitted/zug_zug/CHANGELOG.md"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "minitest-reporters", "~> 1.3"
end
