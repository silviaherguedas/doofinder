FROM elixir:latest

# Install debian packages
RUN apt-get update && \
    apt-get install --yes build-essential inotify-tools postgresql-client git && \
    apt-get clean

# Install hex package manager, rebar and Phoenix packages
RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix archive.install --force hex phx_new 1.6.6

# Install node
RUN curl -sL https://deb.nodesource.com/setup_17.x | bash - && apt-get install -y nodejs

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

CMD ["mix", "phx.server"]