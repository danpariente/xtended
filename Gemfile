source 'http://rubygems.org'


gem 'bundler', '> 1.1.0'
ruby '1.9.3' if ENV['HEROKU']

gem 'rails', '3.2.3'


gem 'devise', '1.5.3'
gem 'cancan'
gem 'nifty-generators'
gem 'newrelic_rpm'
gem 'tinymce-rails'
gem "ckeditor", "3.7.1"
gem 'acts-as-messageable'
#gem 'rack-pjax'
gem 'rest-client'
gem 'geocoder'

group :production do 
  #gem 'thin'
  #gem 'sqlite3'
  #gem 'rails_admin', '~> 0.0.3'
  gem 'fastercsv', '1.5.4', :require => false
  gem 'rack-ssl', :require => 'rack/ssl'
  gem 'rack-rewrite', '~> 1.2.1', :require => false
  gem 'rack-piwik', :require => 'rack/piwik', :require => false
end

# configuration

group :heroku do
  gem 'pg'
  #gem 'unicorn', '~> 4.3.0', :require => false
end

# file uploading

gem 'carrierwave', '0.6.2'
gem 'fog'
gem 'mini_magick', '3.4'

group :development, :test do
  gem 'sqlite3-ruby', :require => 'sqlite3'
  gem 'railroady'    
end

# views

gem 'haml'
gem 'mobile-fu'

gem 'will_paginate'
gem 'client_side_validations'
gem 'gon'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.2.3"
  gem 'coffee-rails', "~> 3.2.1"
  gem 'uglifier'
end

gem 'jquery-rails'

group :development do
  gem 'heroku'
  gem 'heroku_san', '3.0.1', :platforms => :mri_19
  #gem 'capistrano', :require => false
  #gem 'capistrano_colors', :require => false
  #gem 'capistrano-ext', :require => false
  #gem 'linecache', '0.46', :platforms => :mri_18
  gem 'yard', :require => false

  # for tracing AR object instantiation and memory usage per request
  gem 'oink'
end


