# (I don't really care what shell you run these in)

# These need to be run after a new container is started.
# And sometimes later, depending on what you change

# but they take FOREVER like 10 MINUTES OMG so run this in your terminal
# after you start a new container, and meanwhile you see your files.

bundle install
yarn install
rails webpacker:compile
rails db:migrate db:seed
