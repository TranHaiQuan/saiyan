source "https://rubygems.org"

gem "rails", "~> 5.1.6"

# Common
gem "coffee-rails", "~> 4.2"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"

# App server
gem "puma", "~> 3.7"

# Support
gem "config"

# Redis
gem "redis-rails"

# ORM
gem "mysql2", ">= 0.3.18", "< 0.5"

group :development, :test do
  gem "better_errors"
  gem "byebug", platform: :mri
  gem "pry-byebug"
  gem "pry-rails"
  gem "rails-controller-testing"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "rubocop", require: false
  gem "rubocop-checkstyle_formatter"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
