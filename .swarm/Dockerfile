# syntax = docker/dockerfile:1

# Make sure it matches the Ruby version in .ruby-version and Gemfile
ARG RUBY_VERSION=3.2.1
FROM ruby:$RUBY_VERSION-slim as base

# Rails app lives here
WORKDIR /rails

# Set production environment
ENV RAILS_ENV="production" \
    BUNDLE_DEPLOYMENT="1" \
    BUNDLE_PATH="/usr/local/bundle" \
    BUNDLE_WITHOUT="development"


# Throw-away build stage to reduce size of final image
FROM base as build

# Install packages need to build gems and node modules
RUN apt-get update -qq && \
    apt-get install -y build-essential curl default-libmysqlclient-dev git libpq-dev libvips node-gyp pkg-config python-is-python3

# NOTE: Uncomment if you're using JavaScript also
# Install JavaScript dependencies
# ARG NODE_VERSION=19.7.0
# ARG YARN_VERSION=1.22.19

# ENV PATH=/usr/local/node/bin:$PATH
# RUN curl -sL https://github.com/nodenv/node-build/archive/master.tar.gz | tar xz -C /tmp/ && \
#     /tmp/node-build-master/bin/node-build "${NODE_VERSION}" /usr/local/node && \
#     npm install -g yarn@$YARN_VERSION && \
#     rm -rf /tmp/node-build-master

# Install application gems
COPY Gemfile Gemfile.lock ./
RUN bundle install && \
    rm -rf ~/.bundle/ "${BUNDLE_PATH}"/ruby/*/cache "${BUNDLE_PATH}"/ruby/*/bundler/gems/*/.git && \
    bundle exec bootsnap precompile --gemfile

# NOTE: Uncomment if you're using JavaScript also
# Install node modules
# COPY package.json yarn.lock ./
# RUN yarn install --frozen-lockfile

# Copy application code
COPY . .

# Precompile bootsnap code for faster boot times
RUN bundle exec bootsnap precompile app/ lib/

# Precompiling assets for production without requiring secret RAILS_MASTER_KEY
RUN SECRET_KEY_BASE_DUMMY=1 ./bin/rails assets:precompile


# Final stage for app image
FROM base

# curl below is for healthcheck
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y curl default-mysql-client libsqlite3-0 libvips postgresql-client && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

ARG c
ENV APP_REVISION=$revision
RUN echo $APP_REVISION > REVISION

# Run and own the application files as a non-root user for security
RUN useradd ror
USER ror:ror

# Copy built artifacts: gems, application
COPY --from=build --chown=ror:ror /usr/local/bundle /usr/local/bundle
COPY --from=build --chown=ror:ror /rails /rails

# Entrypoint prepares the database.
ENTRYPOINT ["/rails/bin/docker-entrypoint"]

# Start the server by default, this can be overwritten at runtime
EXPOSE 3000
CMD ["./bin/rails", "server"]
