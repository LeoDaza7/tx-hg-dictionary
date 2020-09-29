# README #

This is a Ruby on Rails application to interface the oxford dictionary and its purpose is to search a definition of an english(great britain) word.

## About this project ##

* ruby 2.7.0p0 (2019-12-25 revision 647ee6f091) [x86_64-linux]
* Rails 6.0.3.3
* SQLite 3
* rvm 1.29.10 (manual) by Michal Papis, Piotr Kuczynski, Wayne E. Seguin [rvm](https://rvm.io)

## Configurations ##

After cloning the repository it is required a couple of steps before running the application:

Run:

```terminal
bundle install
```

and(if required):

```terminal
rails db:create
```

```terminal
rails db:migrate
```

Then create a file inside of the `/config` folder, the file should be named `application.yml` and it will be used as an environment file, this file will contain 2 authentication keys to be able to make http request to [The oxford dictionary API](https://developer.oxforddictionaries.com/documentation), the keys will be provided via email.


## Deployment ##

To run the application execute:

```terminal
rails s
```

By default the application will run on http://localhost:3000/

## Dependencies Added ##

### A modern CSS framework based on Flexbox
gem 'bulma-rails', '~> 0.9.0'
### Forms made easy!
gem 'simple_form', '~> 5.0', '>= 5.0.2'
### Makes http fun! Also, makes consuming restful web services dead easy.
gem 'httparty', '~> 0.13.7'
### Simple, Heroku-friendly Rails app configuration using ENV and a single YAML file
gem 'figaro', '~> 1.2'
### Provides a better error page for Rails and other Rack apps. Includes source code inspection, a live REPL and local/instance variable inspection for all stack frames.
  gem 'better_errors', '~> 2.8', '>= 2.8.1'
### Guard::LiveReload automatically reloads your browser when 'view' files are modified.
gem 'guard', '~> 2.16', '>= 2.16.2'
gem 'guard-livereload', '~> 2.5', '>= 2.5.2', require: false
