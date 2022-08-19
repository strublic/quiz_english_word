source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "rails", "~> 7.0.3", ">= 7.0.3.1"

gem "sprockets-rails"
gem "haml-rails", "~> 2.0"
gem "simple_form"
gem "pg"
gem "puma", "~> 5.0"
gem 'pry'
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem 'bootstrap', '~> 5.2.0'
gem 'jquery-rails'
gem 'language_list'


group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "rspec-rails"
  gem "rails-controller-testing"
  gem 'factory_bot_rails'
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem "shoulda-matchers", "~> 5.0"
end