source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.4'

gem 'rails', '~> 6.1.4'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'bootsnap', '>= 1.4.4', require: false
gem 'rack-cors'     #:require => 'rack/cors'
gem 'active_model_serializers', '~>0.10.0'
gem "aws-sdk-s3", require: false
gem 'dotenv-rails'
# for image
gem 'carrierwave'
gem 'fog-aws'
gem 'rmagick'
gem 'mini_magick'

gem 'kaminari'
gem 'jbuilder'


# for jwt
gem 'jwt'
gem 'json-jwt'
gem 'openssl'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'database_cleaner'
  gem 'faker'
  gem 'pry-rails'
  gem 'rails_db', '>= 2.3.1'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'spring'
end


gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
