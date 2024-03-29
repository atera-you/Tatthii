source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.5'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'
#デザイン
gem 'bootstrap-sass', '3.4.1'

#安全なパスワードの実装
gem 'bcrypt',         '3.1.13'
#ページネーション機能の実装
gem 'will_paginate',           '3.1.8'
gem 'bootstrap-will_paginate', '1.0.0'
#リッチテキストの実装
gem 'jquery-rails'
gem 'summernote-rails', '~> 0.8.10.0'
#画像の取り扱い
gem 'rmagick'
#タグ機能の実装
gem 'acts-as-taggable-on','~> 6.0'
#twitterログインの実装
gem 'dotenv-rails',  '2.7.6'
gem 'omniauth' , '2.0.3'
gem "omniauth-rails_csrf_protection"
gem 'omniauth-twitter', '1.4.0'

  gem 'pg', '1.1.4'



# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

    #テスト用
  gem 'rspec-rails', '~> 4.0.2'
  gem 'factory_bot_rails', '~> 6.1.0'
  gem 'faker', git: 'https://github.com/stympy/faker.git', branch: 'master'
  gem 'spring-commands-rspec'
  gem 'database_cleaner-active_record'

end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'forgery_ja'
  gem "capistrano", "~> 3.10", require: false
  gem "capistrano-rails", "~> 1.6", require: false
  gem 'capistrano-rbenv', '~> 2.2'
  gem 'capistrano-rbenv-vars', '~> 0.1'
  gem 'capistrano3-puma'

end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end



# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
