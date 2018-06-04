source "https://rubygems.org"

gem "rails", "~> 5.1.6"

# Common
gem "coffee-rails", "~> 4.2"
gem "sass-rails", "~> 5.0"
gem "uglifier", ">= 1.3.0"

# App server
gem "puma", "~> 3.7"

# ORM
gem "mysql2", ">= 0.3.18", "< 0.5"

gem "devise"

# Soft delete
gem "paranoia", "~> 2.2"

group :development, :test do
  gem "better_errors"
  gem "byebug", platform: :mri
  gem "pry-byebug"
  gem "pry-rails"
  gem "rails-controller-testing"
end

group :development do
  gem "listen", "~> 3.1.5"
  gem "rubocop", require: false
  gem "rubocop-checkstyle_formatter"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
