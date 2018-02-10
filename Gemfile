source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'
gem 'aws-sdk', '~> 2'
gem 'bootstrap', '~> 4.0'
gem 'devise'
gem 'devise_invitable', '~> 1.7.0'
gem 'jquery-rails'
gem 'paperclip', '~> 5.2.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'react-rails'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks', '~> 5'
gem 'webpacker', git: 'https://github.com/rails/webpacker.git'
gem 'lightbox-bootstrap-rails', '5.1.0.1'
gem 'coffee-rails'
gem 'dropzonejs-rails'


group :development, :test do
  gem 'chromedriver-helper'
  gem 'coveralls', require: false
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'launchy'
  gem 'pry-byebug'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
end

group :test do
  gem 'email_spec'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
