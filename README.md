# My Library

Application for the management of my personal library.

My first application written in [Elixir](http://elixir-lang.github.io)
with [Phoenix](http://phoenixframework.org) web framework using and
[Docker](https://www.docker.com).

## Usage

### To start the container and bring up Phoenix server

* Create the .env file in the src folder. To do this, rename the file /src/.env.dist

* To build the container the first time and install all the dependencies,
create the database and run the migrations with the real data load,
we must launch this script:

```bash
./docker_up.sh
```

* The subsequent times, it would be enough to launch only this command
in the root folder:

```bash
docker-compose up
```

* Now you can visit [`localhost:4020`](http://localhost:4020) from your browser.

## Other Uses

### To install project dependencies and perform other setup tasks, run

```bash
docker-compose run --rm phoenix mix setup
```

### To launch the migrations and populate the database with real data, run

```bash
docker-compose run --rm phoenix mix ecto.setup
```

### To enter the container console, run

```bash
docker exec -ti doofinder_phoenix_1 bash
```

### To restart the container, run

```bash
docker-compose restart
```

### To start the database server use

```bash
psql -U postgres
```

### To run the tests, issue the following command

```bash
docker-compose run --rm -e MIX_ENV=test phoenix mix test
```

## Learn more

* [`Phoenix Framework`](https://www.phoenixframework.org/)
* [`Guides`](https://hexdocs.pm/phoenix/overview.html)
* [`Docs`](https://hexdocs.pm/phoenix)
* [`Forum`](https://elixirforum.com/c/phoenix-forum)
* [`Source`](https://github.com/phoenixframework/phoenix)
