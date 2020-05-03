# Secret Project Codename Negroni

## Development

Assumption: we're running Docker for linux containers, and open this project in VSCode, and have the Remote Containers plugin for VSCode.

### Cache volume

you'll need a volume for the caching of all the gems!!!

`docker volume create negronicache`

In devcontainer.json, that gets mounted as a volume into the container.

### Heroku login

We mount login creds from your home directory into the container.

Create `~/.netrc` if it doesn't yet exist on your computer.

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
