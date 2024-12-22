source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem "rails", "~> 8.0.1"
gem "propshaft"
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "tailwindcss-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ windows jruby ]
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"
gem "bootsnap", require: false
gem "kamal", require: false
gem "thruster", require: false

group :development, :test do
  gem "dotenv-rails", "~> 3.1", ">= 3.1.4"
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rspec-rails", "~> 7.0", ">= 7.0.1"
  gem "shoulda-matchers", "~> 6.4"
  gem "factory_bot_rails", "~> 6.4", ">= 6.4.3"
  gem "rubocop-rails-omakase", require: false
  gem "foreman", "~> 0.88.1"
  gem "faker", "~> 3.5"
end

group :development do
  gem "web-console"
end
