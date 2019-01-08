source "https://rubygems.org"
ruby "2.5.1"
gem 'rails', '~> 5.2'
gem 'jbuilder', '~> 2.5'
gem 'figaro'
gem 'pg'
gem 'rails_12factor', group: :production
gem 'responders', '~> 2.0'
gem 'active_model_serializers', require: true
gem 'faraday'
gem 'geocoder'
gem 'newrelic_rpm'
gem 'rack-cors', :require => 'rack/cors'
gem 'bootsnap'
gem 'cloudinary'

group :development, :test do
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.0'
  gem 'database_cleaner'
  gem 'factory_bot_rails', '~> 4.0'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'listen'
end

group :development do
  gem 'web-console', '~> 3.5'
  gem 'spring'
end

group :test do
  gem 'simplecov', require: false
  gem 'vcr'
  gem 'webmock'
end
