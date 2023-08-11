source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1.1'

# Use postgres as the database for Active Record
gem 'pg'

# Use Puma as the app server
gem 'puma', '~> 4.3', '>= 4.3.1'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootstrap', '~> 4.1.3'

# To seed some fake data into the database
gem 'faker'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'faker'
  gem 'capistrano'
  gem 'capistrano-rbenv'
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  gem 'capistrano3-puma'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data'
