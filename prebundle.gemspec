
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "prebundle/version"

Gem::Specification.new do |spec|
  spec.name          = "prebundle"
  spec.version       = Prebundle::VERSION
  spec.authors       = ["kuboon"]
  spec.email         = ["kuboon@trick-with.net"]

  spec.summary       = %q{Run prebundle before bundle install}
  spec.description   = %q{I will output required actions like "yum install hogehoge", "apt install fugafuga" etc }
  spec.homepage      = "https://github.com/kuboon/prebundle"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    #spec.metadata["allowed_push_host"] = "https://rubygems.org"

    #spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = spec.homepage
    #spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "thor", "~> 1.3.0"
end
