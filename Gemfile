# frozen_string_literal: true

source "https://rubygems.org"

# Specify your gem's dependencies in schemify.gemspec
gemspec

group :development, :test do
  gem "rake", require: false
  gem "rubocop", require: false
  gem "rubocop-md", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rake", require: false
end

group :development do
  gem "irb", require: false
end

group :test do
  gem "rspec", require: false
  gem "rubocop-rspec", require: false
  gem "simplecov", require: false
end

group :vscode do
  gem "ruby-lsp-rspec", require: false
end
