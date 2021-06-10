# syntax=docker/dockerfile:1
FROM ruby:2.6.3

RUN curl https://deb.nodesource.com/setup_12.x | bash
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn

WORKDIR /harvest_helper
COPY ./Gemfile /harvest_helper/Gemfile
COPY ./Gemfile.lock /harvest_helper/Gemfile.lock

RUN cd /harvest_helper && bundle install
ADD . /harvest_helper

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]

RUN RAILS_ENV=production bin/rails assets:precompile