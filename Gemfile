# frozen_string_literal: true

source 'https://rubygems.org'

ruby '2.3.7'
gem 'bootstrap-sass'
gem 'coffee-rails'              # Use CoffeeScript for .coffee assets and views
gem 'devise'
gem 'font-awesome-rails'
gem 'jbuilder'                  # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jquery-rails'              # Use jquery as the JavaScript library
gem 'pg'
gem 'puma'                      # Use Puma as the app server
gem 'pundit'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails'
# Use SCSS for stylesheets
gem 'sass-rails'
gem 'sidekiq'
gem 'slim-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks'
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger
  # console
  gem 'byebug', platform: :mri
  gem 'factory_bot_rails'
end

group :test do
  gem 'database_cleaner'
  gem 'guard'
  gem 'minitest-reporters'
  gem 'simplecov'
end

group :development do
  gem 'annotate'
  gem 'listen', '~> 3.0.5'
  gem 'rubocop'
  # Spring speeds up development by keeping your application
  # running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Access an IRB console on exception pages or by using <%= console %>
  # anywhere in the code.
  gem 'web-console'
end

# always use: "bundle install --without production" command to install gems
# during development
group :production do
  gem 'thin'
end

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# We're using 'bcrypt' that comes with devise
# gem 'bcrypt', '~> 3.1.7'        # Use ActiveModel has_secure_password
