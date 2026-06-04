source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Specify your gem's dependencies in event_engine-store.gemspec.
gemspec

# The core gem this store layer builds on. Use the local checkout when it's
# present (development); fall back to the GitHub source on CI, where the sibling
# repo isn't checked out.
event_engine_path = File.expand_path("../event_engine", __dir__)
if File.directory?(event_engine_path)
  gem "event_engine", path: event_engine_path
else
  gem "event_engine", github: "tylercschneider/event_engine"
end

# Omakase Ruby styling [https://github.com/rails/rubocop-rails-omakase/]
gem "rubocop-rails-omakase", require: false

group :development, :test do
  gem "puma"
  gem "sqlite3"
  gem "propshaft"
  gem "pry"
  gem "minitest", "~> 5.0"
end
