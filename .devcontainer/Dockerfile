FROM ruby:2.7.2
RUN apt-get update \
  && apt-get install -y yarnpkg vim lsof \
  && ln -s /usr/bin/yarnpkg /usr/local/bin/yarn \
  && rm -rf /var/lib/apt/lists/*