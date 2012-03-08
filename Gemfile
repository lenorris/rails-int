source 'http://rubygems.org'

gem 'rails', '3.1.1'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# Heroku needed gems
gem 'heroku'
gem 'execjs'
gem 'therubyracer'
gem 'jquery-rails'
gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git', :branch => 'static'
gem 'json'
gem 'isbn_validator', :git => 'git://github.com/Eficode/isbn_validator.git'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

# Heroku does not support SQLite, use PostgreSQL instead
group :production do
  gem 'pg'
end

group :development do
  gem 'sqlite3'
  gem 'heroku'
end

group :test do
  gem 'factory_girl_rails'
  gem 'guard-test'
  gem 'shoulda'
end

