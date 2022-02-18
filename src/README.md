# Mylibrary

Application for the management of my personal library.

My first application written in [Elixir](http://elixir-lang.github.io)
with [Phoenix](http://phoenixframework.org) web framework using
[Docker](https://www.docker.com).

## Usage

### To start the container and its Phoenix server

* Create the .env file in the src folder. To do this, rename the file /src/.env.dist

* To build the container with its dependencies, create the database and populate it with data, launch this script:

```bash
./docker_up.sh
```

* Now you can visit [`localhost:4020`](http://localhost:4020) from your browser.

### To enter the container console

```bash
docker exec -ti doofinder_phoenix_1 bash
```

### To restart the container

```bash
docker-compose restart
```

### To start the database server use

```bash
psql -U postgres
```

## Running the tests

Execute this command:

```bash
docker-compose run --rm -e MIX_ENV=test web mix test
```

## Learn more

* [`Phoenix Framework`](https://www.phoenixframework.org/)
* [`Guides`](https://hexdocs.pm/phoenix/overview.html)
* [`Docs`](https://hexdocs.pm/phoenix)
* [`Forum`](https://elixirforum.com/c/phoenix-forum)
* [`Source`](https://github.com/phoenixframework/phoenix)
