# frozen_string_literal: true

require_relative "lib/schemify/version"

Gem::Specification.new do |spec|
  spec.name = "schemify"
  spec.version = Schemify::VERSION
  spec.authors = ["Rylan Polster"]
  spec.email = ["rslpolster@gmail.com"]

  spec.summary = "Generate JSON schemas with code"
  spec.description = "Use Ruby code to generate JSON schemas with intelligent defaults, validation, and versioning."
  spec.homepage = "https://github.com/Rylan12/schemify"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Rylan12/schemify"
  spec.metadata["changelog_uri"] = "https://github.com/Rylan12/schemify/blob/main/CHANGELOG.md"
  spec.metadata["rubygems_mfa_required"] = "true"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.require_paths = ["lib"]
end
