# Project for catching up to people without calendaring

Production: [catchupto.me](https://catchupto.me)

Circle CI: [![<gracefuldev>](https://circleci.com/gh/gracefuldev/sixmilebridge.svg?style=svg)](https://app.circleci.com/pipelines/github/gracefuldev/sixmilebridge)

## Development

Assumption: we're running Docker for linux containers, and open this project in VSCode, and have the Remote Containers plugin for VSCode.

### Docker compose

service 1: Rails.

In development we use sqlite, so we don't need a db container

service 2: Selenium

Not yet used; it's for headlessly running system tests, someday

volume: cache

This is for bundle install, so we don't have to download the world again when we start a fresh container.

## Run locally

Avdi, is there a command to get webpacker to precompile? because hitting the server for the first time takes FOREVER and that's just weird.

`rails server`

(not "serve", no, and that won't suggest that you 'server' either. Also, it'll tell you to try --tasks, but NO, that only shows you the ones implemented in rake, so you're fucked if you don't know what to type. dammit rails)

The local version uses a basic auth instead of Google auth. You can log in with any name as long as you use Avdi's email address.

## Test

System test is interesting. Here's how to run them on the host browser.

On your real computer, install Chrome and chromedriver. ([what is chromedriver?](https://avdi.codes/rails-6-system-tests-from-top-to-bottom/)) You can install chromedriver on windows with (in an admin shell) `choco install chromedriver`.

Then run this to let chromedriver accept connections only from the Docker container that will run your system tests.

```
chromedriver --whitelisted-ips=$(docker container inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'  sixmilebridge_devcontainer_app_1)
```

and then when the firewall yells at you, give it access on private networks.

In the app's docker container, `RUBYOPT=-W0 rails test:system`

(the RUBYOPT=-W0 suppresses warnings, including a zillion deprecation warnings from Ruby 2.7, which obscure the test output.)

For a full description of how we got this working: https://avdi.codes/run-rails-6-system-tests-in-docker-using-a-host-browser/

## Shut down docker containers

to clean up, close VSCode and then, from the project directory:

`docker-compose -f .\.devcontainer\docker-compose.yml --project-name "sixmilebridge_devcontainer" down`

## Deploy

[Circle CI](https://app.circleci.com/pipelines/github/gracefuldev/sixmilebridge) handles that

## Production logs

### Heroku login

(only if you're gonna do stuff with prod, like look at logs)

(where by "you" I mean "us" not people generally)

If you're going to deploy, then you'll need to log in to Heroku.

Inside the container, you can `heroku login -i`.

To link your git repo to the heroku app: `heroku git:remote sixmilebridge`

Now you can `heroku logs` or `heroku run rake db:seed`

### Development

You can copy `.env.example` to `.env` to put secrets in, like the HONEYCOMB_WRITEKEY if you want to send stuff to Honeycomb in dev.

The `.env` file is ignored by git.

### Production

`heroku config:set HONEYCOMB_WRITEKEY=<letters and numbers>`
