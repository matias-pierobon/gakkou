source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'bootstrap', '~> 4.0.0.beta2.1'
gem 'bootstrap-datepicker-rails'
gem 'devise'
gem 'jquery-rails'
gem 'pg'
gem 'puma', '~> 3.7'
gem 'rails', '~> 5.1.4'
gem 'sass-rails', '~> 5.0'
gem 'simple_form'
gem 'uglifier', '>= 1.3.0'
gem 'validates_overlap'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails', '~> 3.6'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', '~> 3.1'
end

group :development do
  gem 'hirb'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data'
