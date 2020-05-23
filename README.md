# Project for catching up to people without calendaring

## Development

Assumption: we're running Docker for linux containers, and open this project in VSCode, and have the Remote Containers plugin for VSCode.

### Docker compose

service 1: Rails.

In development we use sqlite, so we don't need a db container

service 2: Selenium

Not yet used; it's for headlessly running system tests, someday

volume: cache

This is for bundle install, so we don't have to download the world again when we start a fresh container.

### Heroku login

We mount login creds from your home directory into the container.

Create `~/.netrc` if it doesn't yet exist on your computer.

... is this still true?

If you're going to deploy, then you'll need to log in to Heroku.

Inside the container, you can `heroku login`.

### Finally

Then have VSCode open this project in a container.

## Cruft

Things you may want to cover:

* Ruby version

which apparently is 2.5 but we want 2.7 but installing that on Debian 10 is nontrivial

* System dependencies

see Dockerfile

* Configuration

* Database creation

there's a database?

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

cronch cronch

* Deployment instructions

please

* ...

That's supported in Ruby 2.7
