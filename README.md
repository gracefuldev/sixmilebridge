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

(only if you're gonna do stuff with prod, like deploy)

We mount login creds from your home directory into the container.

Create `~/.netrc` if it doesn't yet exist on your computer. (If it doesn't, and you've started the container, I'm sorry. It probably screwed it up and made an empty directory there. Remove that, create an empty file instead, and rebuild the container in VSCode.)

If you're going to deploy, then you'll need to log in to Heroku.

Inside the container, you can `heroku login`.

To link your git repo to the heroku app: `heroku git:remote sixmilebridge`

## secrets

### Development

You can copy .env.example to .env to put secrets in, like the HONEYCOMB_KEY if you want to send stuff to Honeycomb in dev.

### Production

`heroku config:set HONEYCOMB_KEY=<letters and numbers>`
