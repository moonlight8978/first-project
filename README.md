# __< Project name >__

(Ruby on Rails (Rails API), AngularJS (ES6), Bootstrap 4, JWT Authentication....)

#### (This  is for studying. Everything is fiction.)

---

## Environment:

NodeJS, RailsInstaller (Ruby 2.3, Rails 5), XAMPP

###### NodeJS global package: 
* `$ npm i -g gulp bower`

###### Server
* `$ bundle install`

* `$ rake db:create`

* `$ rake db:migrate`

* run: 
**`$ rails s`
**`$ redis-server`
**`$ bundle exec sidekiq -C config/sidekiq.yml`

###### Client
* `$ bower install`

* `$ npm install`

* run: `$ http-server -c-1` or `$ npm run start`

###### MySQL
* user: `root`
* password: none

## Dev Support Tool
###### Build sass, ES6
* `$ gulp js:build`

* `$ gulp css:build`

###### Build on saving
* `$ gulp js:watch`

* `$ gulp css:watch`
* `$ gulp watch` (not implemented yet)
