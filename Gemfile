source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.2'

gem 'rails',                                '~> 5.2.2'
gem 'pg',                                   '>= 0.18', '< 2.0'
gem 'puma',                                 '~> 3.11'
gem 'bcrypt',                               '~> 3.1.7'
gem 'bootsnap',                             '>= 1.1.0', require: false
gem 'jwt',                                  '~> 2.1'
gem 'rack-cors'
gem 'rack-attack'

group :test do
  gem 'database_cleaner',                   '~> 1.7'
  gem 'shoulda-matchers',                   '~> 4.0', '>= 4.0.1'
  gem 'ffaker',                             '~> 2.10'
end

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails',                        '~> 3.8', '>= 3.8.2'
  gem 'factory_bot_rails',                  '~> 5.0', '>= 5.0.1'
  gem 'dotenv-rails',                       '~> 2.7', '>= 2.7.1'
  gem 'pry-rails',                          '~> 0.3.9'
  gem  'awesome_print'
end

group :development do
  gem 'listen',                             '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen',              '~> 2.0.0'
end

group :staging, :production do
  gem 'rack-timeout',                         '~> 0.5.1'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
