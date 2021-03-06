# frozen_string_literal: true

source 'https://rubygems.org'
ruby "2.4.1"
#ruby "2.6.2"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
# gem 'rails', '4.2.5'
# gem 'rails', '4.2.8'
# gem 'rails', '4.2.10'
gem 'rails', '5.0.7'
#gem 'rails', '5.1.0'

#gem 'rails', '5.2.2'


# gem 'rails', '5.2.0'

# Use sqlite3 as the database for Active Record
# gem 'sqlite3'

# use Postgres on Heroku
 gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
#gem 'jquery-rails'

gem 'jquery-rails', '~> 4.3', '>= 4.3.1'

# gem 'jquery-rails', '~> 2.3.0'

# it conflicts with compass and sass {but needed for commontator?}
# gem 'sassc-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# devise
# gem 'devise', '~> 3.5', '>= 3.5.6'
gem 'devise'

#sassy
# gem 'bootstrap-sass', '~> 3.3', '>= 3.3.6'

gem 'bootstrap-sass', '~> 3.4', '>= 3.4.1'

#gem "bootstrap-sass", ">= 3.4.1"  #fix vulnerability
gem 'bootstrap-sass-extras', '~> 0.0.7'
gem 'font-awesome-sass', '~> 4.6.2'

# gem 'simple_form', '~> 3.2', '>= 3.2.1'
gem "simple_form"

# forest admin
# gem 'forest_liana'  -- no support for it

# metasearch replacement  - ok now?
# gem 'ransack', github: 'activerecord-hackery/ransack'

# pagination
# gem 'will_paginate', github: 'jonatack/will_paginate'
# gem 'will_paginate-bootstrap'


gem 'pagy', '~> 2.1', '>= 2.1.4'
# gem 'pagy-extras' no logner needed

gem 'faker'
gem 'populator', '~> 1.0'

gem 'validates_timeliness', '~> 4.0'

gem 'breadcrumbs_on_rails'

gem 'impressionist'

# gem 'commontator'

gem 'tzinfo-data'

gem 'cancan'

gem 'cloudinary'

# gem 'jquery-ui-rails', '~> 4.2.1' # not sure it this works (with the timeout)

gem 'jquery-ui-rails', '~> 6.0', '>= 6.0.1'

gem 'auto-session-timeout'

# gem 'auto-session-timeout-warning'

gem 'redis'

gem 'acts_as_votable', '~> 0.12.0'

gem 'groupdate'

gem 'chartkick'


#gem "ckeditor", :git => "https://github.com/galetahub/ckeditor.git"




gem 'carrierwave'
gem 'mini_magick'

gem 'email_validator'

# compass for sytlesheets
gem 'compass-rails'

# omniauth
gem 'omniauth'
# for facebook authentication
gem 'omniauth-facebook'

# for keeping secret api keys
gem 'figaro'

# country country_select
gem 'country_select'

# validations
gem 'client_side_validations'
gem 'client_side_validations-simple_form', '~> 6.7'

gem 'rubocop', '~> 0.60.0', require: false

# elasticsearch
gem 'elasticsearch-model', github: 'elastic/elasticsearch-rails', branch: '5.x'
gem 'elasticsearch-rails', github: 'elastic/elasticsearch-rails', branch: '5.x'

gem "sentry-raven"

gem "cocoon"

gem 'stripe', '~> 5.12'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'sqlite3', '~> 1.3.0'

end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem 'pry-rails'
  gem 'spring'
end

group :production do

  gem 'rails_12factor', '~> 0.0.3'
end

#gem 'sqlite3', '1.3.13', :group => [:development, :test]
