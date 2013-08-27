source 'https://rubygems.org'

gem 'devise'

group :development do
  # Annotate models
  gem 'migration_comments'
  gem 'annotate', ">=2.5.0" # Generate model annotation
end

gemspec