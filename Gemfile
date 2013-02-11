source 'https://rubygems.org'

# Heroku uses the ruby version to configure your application's runtime.
ruby '1.9.3'

gem 'thin'
gem 'rails', '~> 3.2.11'
gem 'aws-sdk', '~> 1.3.4'
gem "paperclip", "~> 3.0"

gem 'jquery-rails'
gem 'sorcery'
gem 'cancan'
gem 'active_attr'
gem 'valid_email'
gem 'pg'
gem 'rails-i18n'
gem 'dynamic_form'
gem 'decent_exposure'
gem 'chosen_rails'

group :assets do
  gem 'sass-rails', '~> 3.2.3'
  gem 'bootstrap-sass', '~> 2.2.2.0'
  gem 'coffee-rails'
  gem 'uglifier'

  # Heroku suggests that these gems aren't necessary, but they're required to compile less assets on deploy.
  gem 'therubyracer'
  gem 'libv8', '~> 3.11.8'
end

group :test, :development do
  gem 'rspec-rails', '~> 2.12.0'
  gem 'capybara', '~> 2.0'
  gem 'capybara-email'
  gem 'factory_girl_rails'
  gem 'jasminerice'
  gem 'timecop'
  gem 'simplecov'
  gem 'cane'
  gem 'morecane'
  gem 'quiet_assets'
end

group :test do
  gem 'fuubar'
  gem 'database_cleaner'
end

group :development do
  gem 'foreman'
  gem 'launchy'
  gem 'mailcatcher'
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-jasmine'
  gem 'guard-livereload'
  gem 'rb-fsevent'
  gem 'growl'
  gem 'awesome_print'
end
