source 'https://rubygems.org'


gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'pg'
gem 'puma'
gem 'rack-cors'
gem 'httparty'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'rspec-rails'
  gem "factory_girl_rails", "~> 4.0"
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'database_cleaner'
  gem 'formulaic'
  gem 'json_matchers'
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'timecop'
  gem 'webmock', '1.24.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
