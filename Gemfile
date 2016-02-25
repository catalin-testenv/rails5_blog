source 'https://rubygems.org'

# Shim to load enviroment varibles from .env file
gem 'dotenv-rails', :require => 'dotenv/rails-now'

# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.18', '< 0.5'
# Authentication
gem 'devise', '>= 4.0.0.rc1', '< 4.1'
# Omniauth gems
# https://github.com/zquestz/omniauth-google-oauth2
gem 'omniauth-google-oauth2'
gem 'pundit', '~> 1.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '>= 5.0.0.beta3', '< 5.1'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use Puma as the app server
gem 'puma'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# https://github.com/zurb/foundation-rails
# gem 'foundation-rails'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# Action Cable dependencies for the Redis adapter
gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# allow assets be precompiled +without cache busting
# https://github.com/alexspeller/non-stupid-digest-assets
# gem "non-stupid-digest-assets"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # silence sprockets verbosity
  gem 'quiet_assets'
end

group :production do
  # for some 3rd party libs we need to redirect
  # FROM non digested/cache_busted assets links TO digested/cache_busted assets links
  # https://github.com/sikachu/sprockets-redirect
  gem 'sprockets-redirect'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
