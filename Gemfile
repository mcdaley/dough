#------------------------------------------------------------------------------
# Gemfile
#------------------------------------------------------------------------------
source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.3'

gem 'rails',      '~> 5.2.0'
gem 'pg',         '>= 0.18', '< 2.0'
gem 'puma',       '~> 3.11'
gem 'webpacker'                 # Read more: https://github.com/rails/webpacker
gem 'jbuilder',   '~> 2.5'      # Read more: https://github.com/rails/jbuilder

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap',                 '>= 1.1.0', require: false

gem 'haml',                     '~> 5.0'
gem 'awesome_print'

gem 'devise',                   '~> 4.4'
gem 'devise_token_auth',        '~> 0.1'
gem 'omniauth'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug',                 platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails',            '~> 3.7'
  gem 'factory_bot_rails',      '~> 4.10'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console',            '>= 3.3.0'
  gem 'listen',                 '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen',  '~> 2.0.0'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'annotate'
end

group :test do
  gem 'shoulda-matchers',       '~> 3.1'
  gem 'database_cleaner',       '~> 1.7'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
