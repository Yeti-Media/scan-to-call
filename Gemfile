source 'https://rubygems.org'

gem 'actionpack', '3.2.9'
gem 'mongoid'
gem 'strong_parameters', github: 'rails/strong_parameters'
gem 'etagger', github: 'rails/etagger'
gem 'active_model_serializers', github: 'josevalim/active_model_serializers'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

# Use puma as the app server
gem 'puma'

group :development, :test do
  gem 'rspec-rails'
end

group :test do
  gem 'capybara'
end

group :production do
  gem 'pg'
  gem 'dalli'
end
