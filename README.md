# My Library

Application for the management of my personal library.

My first application written in [Elixir](http://elixir-lang.github.io)
with [Phoenix](http://phoenixframework.org) web framework using and
[Docker](https://www.docker.com).

## Usage

### To start the container and bring up Phoenix server

* Create the .env file in the src folder. To do this, rename the file .env.dist

* Follow these steps:

```bash
# 1. To build the container the first time and install all the dependencies, create the database and run the migrations with the real data load, we must launch this script:
./docker_up.sh

# 2. Access the container, from the console
docker exec -ti doofinder_phoenix_1 bash

# 3. Assign permissions for the local user
chown -R $(id -u):$(id -g) _build/
chown -R $(id -u):$(id -g) deps/

# 3. Install Npm dependencies
cd assets
npm install
# Run frontend build, compile, and digest assets
mix do compile, phx.digest
```

* The subsequent times, it would be enough to launch only this command
in the root folder:

```bash
docker-compose up
```

* Now, you can visit [`localhost:4020`](http://localhost:4020) from your browser.

## Other Uses

When building the container, an alias "mix" is created to facilitate the execution of Elixir commands, so that "mix" can be invoked directly to execute commands inside the container:

```bash
alias mix="docker-compose run --rm phoenix mix"
```

### To install project dependencies and perform other setup tasks

```bash
# Without alias
docker-compose run --rm phoenix mix setup

# With alias
mix setup
```

### To launch the migrations and populate the database with real data

```bash
# Without alias
docker-compose run --rm phoenix mix ecto.setup

# With alias
mix ecto.setup
```

### To run the tests, issue the following command

```bash
# Without alias
docker-compose run --rm -e MIX_ENV=test phoenix mix test

# With alias
MIX_ENV=test mix test
```

### To enter the container console, run

```bash
docker exec -ti doofinder_phoenix_1 bash
```

### To stop and delete the container

```bash
docker-compose down
```

### To restart the container, run

```bash
docker-compose restart
```

### To start the database server use

```bash
psql -U postgres
```

## Learn more

* [`Phoenix Framework`](https://www.phoenixframework.org/)
* [`Guides`](https://hexdocs.pm/phoenix/overview.html)
* [`Docs`](https://hexdocs.pm/phoenix)
* [`Forum`](https://elixirforum.com/c/phoenix-forum)
* [`Source`](https://github.com/phoenixframework/phoenix)
