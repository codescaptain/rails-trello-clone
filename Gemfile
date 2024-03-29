# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.4'

gem 'activerecord-import'
gem 'bcrypt'
gem 'bootsnap', require: false
gem 'bugsnag', '~> 6.26'
gem 'devise'
gem 'importmap-rails'
gem 'jbuilder'
gem 'jsonapi-serializer'
gem 'jwt'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'pundit'
gem 'rack-cors'
gem 'rails', '~> 7.0.7', '>= 7.0.7.2'
gem 'redis', '~> 4.0'
gem 'sassc-rails'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'tailwindcss-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'lokalise_rails'
# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  gem 'brakeman'
  gem 'bundler-audit'
  gem 'byebug'
  gem 'database_consistency'
  gem 'database_validations'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 6.0.0'
  gem 'rubocop'
  gem 'rubocop-rails'
  gem 'ruby_audit'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'web-console'

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  gem 'rails-controller-testing'
  gem 'shoulda-matchers', '~> 5.0'
end
